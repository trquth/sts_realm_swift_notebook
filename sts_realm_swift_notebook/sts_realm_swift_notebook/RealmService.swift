//
//  RealmService.swift
//  sts_realm_swift_notebook
//
//  Created by Thien Tran on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    private init(){}
    static let shared = RealmService()
    var realm = try! Realm()
    
    func create<T: Object>(_ object : T)  {
        do {
            try realm.write {
                realm.add(object)
            }
        }catch {
            post(error)
        }
    }
    
    func update<T:Object>(_ object : T, with dictionary : [String : Any]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch  {
            post(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch  {
            post(error)
        }
    }
    
    func post(_ error : Error) {
        NotificationCenter.default.post(name:
            Notification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in vc : UIViewController,
                            completion : @escaping(Error?) -> Void)  {
        NotificationCenter.default.addObserver(forName: Notification.Name("RealmError"), object: nil, queue: nil, using: {notification in completion(notification.object as? Error)})
    }
    
    func stopObservingErrors(in vc : UIViewController)  {
        NotificationCenter.default.removeObserver(vc, name: Notification.Name("RealmError"), object: nil)
    }
}

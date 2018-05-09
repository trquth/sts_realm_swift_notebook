//
//  PrimaryKeyUtility.swift
//  sts_realm_swift_notebook
//
//  Created by Thien Tran on 5/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

class PrimaryKeyUtility {
    
    private init() {}
    static let shareInstance  = PrimaryKeyUtility()
    let realm = try! Realm()
    
    func incrementID<T: Object>(_ obj : T.Type) -> Int {
       
        return (realm.objects(obj).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}

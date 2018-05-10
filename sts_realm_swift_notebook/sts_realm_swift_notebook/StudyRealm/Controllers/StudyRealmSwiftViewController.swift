//
//  StudyRealmSwiftViewController.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import RealmSwift

class StudyRealmSwiftViewController: UIViewController {
    
    let  realm  = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setUpViews()
        seed()
        //getAllUsers()
        //getUserBy(1)
        //getTodosOfUser(1)
         print(Realm.Configuration.defaultConfiguration.fileURL)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func seed() {
        
        try! realm.write {
            var id = PrimaryKeyUtility.shareInstance.incrementID(Authority.self)
            realm.create(Authority.self, value: [id,"Read"])
            
            id = PrimaryKeyUtility.shareInstance.incrementID(Authority.self)
            realm.create(Authority.self, value: [id,"Write"])
            
            id = PrimaryKeyUtility.shareInstance.incrementID(Authority.self)
            realm.create(Authority.self, value: [id,"Edit"])
            
            id = PrimaryKeyUtility.shareInstance.incrementID(Authority.self)
            realm.create(Authority.self, value: [id,"Delete"])
        }
        
        try! realm.write {
            var id = PrimaryKeyUtility.shareInstance.incrementID(User.self)
            var predicate = NSPredicate(format: "id IN { %d , %d}",1,2)
            var roles = realm.objects(Authority.self).filter(predicate)
            realm.create(User.self, value: [id,"Thien", 25, roles])
            
            id = PrimaryKeyUtility.shareInstance.incrementID(User.self)
            predicate = NSPredicate(format: "id IN { %d , %d}",0,2)
            roles = realm.objects(Authority.self).filter(predicate)
            realm.create(User.self, value: [id,"Thien 2", 26, roles])
            
            id = PrimaryKeyUtility.shareInstance.incrementID(User.self)
            predicate = NSPredicate(format: "id IN { %d , %d}",3,4)
            roles = realm.objects(Authority.self).filter(predicate)
            realm.create(User.self, value: [id,"Thien 3", 26, roles])
        }

        try! realm.write{
            
            for index in 0...20 {
                let user = realm.objects(User.self).filter(NSPredicate(format : "id = %d", Int(arc4random_uniform(4)))).first
                let id = PrimaryKeyUtility.shareInstance.incrementID(Todo.self)
                let title = "\(index) - Study Realm Practice"
                let note = "This demo use for beginner"
                realm.create(Todo.self, value: [id,title,note,Priority.High.rawValue,user])
            }
            
        }
    }
    
    func getAllUsers() -> [User] {
        let data = realm.objects(User.self)
        print("Data ---->", data.count != 0 ? data[0] : "Empty")
        return Array(data)
    }
    
    func getUserBy(_ id : Int) -> User? {
        let data = realm.object(ofType: User.self, forPrimaryKey: id)
        print("Data ---->", data ??  "Empty")
        return data
    }
    
    func getTodosOfUser(_ userId : Int) -> [Todo] {
        let predicate = NSPredicate(format: "user.id = %d ", userId)
        let data = realm.objects(Todo.self).filter(predicate)
        print("Data ---->", data.count != 0 ? data[0] : "Empty")
        return Array(data)
    }
    
    let helloWorld : UILabel = {
        
        let helloWorld = UILabel()
        helloWorld.translatesAutoresizingMaskIntoConstraints = false
        helloWorld.text = "Hello World"
        helloWorld.font = UIFont.boldSystemFont(ofSize: 20)
        helloWorld.textColor = .black
        
        return helloWorld
    }()
    
    func setUpViews(){
        view.addSubview(helloWorld)
        view.backgroundColor = .white
        
        helloWorld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloWorld.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

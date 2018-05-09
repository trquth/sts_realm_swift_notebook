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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        seed()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func seed() {
        
        let realm = try! Realm()
    
        try! realm.write {
            let id = PrimaryKeyUtility.shareInstance.incrementID(User.self)
            realm.create(User.self, value: [id,"Thien", 25])
        }
        
        try! realm.write{
            
            let user = realm.objects(User.self).first
            let id = PrimaryKeyUtility.shareInstance.incrementID(Todo.self)
            realm.create(Todo.self, value: [id,"Seed 1","Note 1",Priority.High.rawValue,user])
        }
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

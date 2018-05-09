//
//  Dog.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

enum Priority : Int {
   case Low = 0
   case Medium = 1
   case High = 2
}

class Todo: Object {
    
    @objc dynamic var id : String = NSUUID().uuidString
    @objc dynamic var title : String = ""
    @objc dynamic var note: String? = nil
    let priority = RealmOptional<Int>()
    @objc dynamic var user : User?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

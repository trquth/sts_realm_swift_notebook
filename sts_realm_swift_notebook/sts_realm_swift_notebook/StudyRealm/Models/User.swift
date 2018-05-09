//
//  User.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object{
    
    @objc dynamic var id : String = NSUUID().uuidString
    @objc dynamic var userName : String = ""
    let age = RealmOptional<Int>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

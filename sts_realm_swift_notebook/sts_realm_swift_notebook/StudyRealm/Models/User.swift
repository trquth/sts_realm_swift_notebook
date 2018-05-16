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
    
    @objc dynamic var id : Int = 0
    @objc dynamic var userName : String = ""
    let age = RealmOptional<Int>()
    let roles = List<Authority>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

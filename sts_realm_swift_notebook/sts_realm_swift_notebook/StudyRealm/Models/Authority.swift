//
//  Authority.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/10/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

class Authority : Object {
    
    @objc dynamic var id  : Int = 0
    @objc dynamic var role : String? = nil
    
    override static func primaryKey() -> String?{
        return "id"
    }
}

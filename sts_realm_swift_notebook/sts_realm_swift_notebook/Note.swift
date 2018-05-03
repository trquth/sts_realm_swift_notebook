//
//  Note.swift
//  sts_realm_swift_notebook
//
//  Created by Thien Tran on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Note : Object {
    
    dynamic var line : String = ""
    let score = RealmOptional<Int>()
    dynamic var email : String? = nil
    
    convenience init(line : String, score: Int?, email: String?) {
        self.init()
        self.line = line
        self.score.value = score
        self.email = email
    }
    
    func scoreString() -> String {
        guard  let score = score.value else {
            return ""
        }
        
        return String(score)
    }
}

//
//  AlertService.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AlertService {
    static func addAlert(in vc : UIViewController, completion: @escaping (String, Int?, String?) -> Void){
        let alert = UIAlertController(title: "Add Line", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {
            lineTF in lineTF.placeholder = "Enter Pick Up Line"
        })
        alert.addTextField(configurationHandler: {
            scoreTF in scoreTF.placeholder = "Enter Score"
        })
        alert.addTextField(configurationHandler: {
            emailTF in emailTF.placeholder = "Enter Email"
        })
        
        let action = UIAlertAction(title: "Add", style: .default, handler: {
            _ in guard let line = alert.textFields?.first?.text,
            let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?.last?.text else {return}
            
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            
            completion(line, score, email)
            
        })
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
    static func updateAlert(in vc : UIViewController, note : Note,
                            completion : @escaping (String, Int?, String?) -> Void){
        let alert = UIAlertController(title: "Update Line", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {lineTF in
            lineTF.placeholder = "Enter Pick Up Line"
            lineTF.text = note.line
        })
        alert.addTextField(configurationHandler: {scoreTF in
            scoreTF.placeholder = "Enter Score"
            scoreTF.text = note.scoreString()
        })
        alert.addTextField(configurationHandler: {emailTF in
            emailTF.placeholder = "Enter Email"
            emailTF.text = note.email
        })
        
        let action = UIAlertAction(title: "Update", style: .default, handler: {
            _ in guard let line = alert.textFields?.first?.text,
                let scoreString = alert.textFields?[1].text,
                let emailString = alert.textFields?.last?.text else {return}
            
            let score = scoreString == "" ? nil : Int(scoreString)
            let email = emailString == "" ? nil : emailString
            
            completion(line, score, email)
            
        })
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}

//
//  UIImageExtension.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/25/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String) {
        
        let urlString = URL(string: urlString)
        guard let url = urlString  else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }

}

//
//  NoteRow.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class NoteRow: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "TEST"
        return label
    }()
    
    let mail : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "demo@gmail.com"
        return label
    }()
    
    let number : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "10"
        return label
    }()
    
    func setupViews()  {
        addSubview(title)
        addSubview(mail)
        addSubview(number)
        
        let views = ["v1" : title,"v2" : mail, "v3" : number]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:[v3]-5-|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v2]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]|", options: [], metrics: nil, views: views))
    }
}

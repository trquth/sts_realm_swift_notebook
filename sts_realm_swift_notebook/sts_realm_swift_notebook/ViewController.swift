//
//  ViewController.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let rowId = "NoteRowId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        table.register(NoteRow.self, forCellReuseIdentifier: rowId)
        table.delegate = self
        table.dataSource = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .purple
        return view
    }()
    
    let headerTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "NOTEBOOK"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        
        return label
    }()
    
    let headerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        return button
    }()
    
    let table : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    func setupViews()  {
        view.addSubview(headerView)
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerButton)
        view.addSubview(table)
        
        let views = ["v1" : headerView,
                     "v2" : headerTitle,
                     "v3" : headerButton,
                     "v4" : table
        ]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(80)]", options: [], metrics: nil, views: views))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v2]|", options: [], metrics: nil, views: views))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v3]|", options: [], metrics: nil, views: views))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(30)]|", options: [], metrics: nil, views: views))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v3]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v4]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(80)][v4]|", options: [], metrics: nil, views: views))
       
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}


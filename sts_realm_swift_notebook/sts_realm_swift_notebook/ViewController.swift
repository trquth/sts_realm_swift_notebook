//
//  ViewController.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private let rowId = "NoteRowId"
    var notes : Results<Note>!
    var notificationToken : NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        table.register(NoteRow.self, forCellReuseIdentifier: rowId)
        table.delegate = self
        table.dataSource = self
        
        headerButton.addTarget(self, action: #selector(onAddTapped), for: .touchUpInside)
        
        let realm = RealmService.shared.realm
        notes = realm.objects(Note.self)
        
        notificationToken =  realm.observe{ (notification, realm) in
            self.table.reloadData()
        }
        
        print(realm.configuration.fileURL)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        notificationToken?.invalidate()
    
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
    
    @objc func onAddTapped(){
        AlertService.addAlert(in: self, completion: {(line, score, email) in
            let newNote = Note(line: line, score: score, email: email)
            RealmService.shared.create(newNote)
            
        })
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as? NoteRow else {
            return UITableViewCell()
        }
        
        let note = notes[indexPath.row]
        cell.configure(with: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let note = notes[indexPath.row]
        AlertService.updateAlert(in: self, note: note, completion: {(line, score, email) in
            let dict : [String :Any?] = ["line": line,
                                         "score" : score,
                                         "email": email]
            RealmService.shared.update(note, with: dict)
        })
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        let note = notes[indexPath.row]
        RealmService.shared.delete(note)
    }
    
}


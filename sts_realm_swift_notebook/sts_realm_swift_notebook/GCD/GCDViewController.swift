//
//  GCDViewController.swift
//  sts_realm_swift_notebook
//
//  Created by Thien Tran on 5/16/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {
    
    let main = DispatchQueue.main
    let background = DispatchQueue.global()
    let asianWorker = DispatchQueue(label: "construction_worker_1")
    let brownWorker = DispatchQueue(label: "construction_worker_2")
    let blackWorker = DispatchQueue(label: "construction_worker_3", qos: .userInitiated)
    let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .background)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        doPriorityAsyncWork()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func doSyncWork() {
        background.sync {
            for _ in 1...3 {
                print("Light")
            }
        }
        
        for _ in 1...3 {
            print("Heavy")
        }
    }
    
    func doAsyncWork() {
        background.async {
            for _ in 1...3 {
                print("Light")
            }
        }
        
        for _ in 1...3 {
            print("Heavy")
        }
    }
    
    func doSameTimeAsyncWork() {
        asianWorker.async {
            for _ in 1...3 {
                print("👷🏻")
            }
        }
        
        brownWorker.async {
            for _ in 1...3 {
                print("👷🏼")
            }
        }
    }
    
    func doPriorityAsyncWork() {
        whiteWorker.async {
            for _ in 1...3 {
                print("👷🏻")
            }
        }
        
        blackWorker.async {
            for _ in 1...3 {
                print("👷🏿")
            }
        }
    }

    let gcdTitle : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.text = "GRAND CENTRAL DISPATCH"
        title.font = UIFont.systemFont(ofSize: 25)
        title.textColor = .red
        
        return title
    }()
    
    func setupViews() {
        view.addSubview(gcdTitle)
        view.backgroundColor = .white
        
        gcdTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gcdTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

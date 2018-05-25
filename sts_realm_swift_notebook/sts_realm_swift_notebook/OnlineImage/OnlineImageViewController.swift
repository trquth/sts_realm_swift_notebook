//
//  OnlineImageViewController.swift
//  sts_realm_swift_notebook
//
//  Created by mac on 5/25/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class OnlineImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named:"swift")
        
        return image
    }()
    
    
    func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.imageFromServerURL(urlString: "https://picsum.photos/200/300")
        
        let views = ["v1" : imageView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1(80)]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1(80)]", options: [], metrics: nil, views: views))
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}

//
//  ProfileVC.swift
//  byeDebt
//
//  Created by Andres Quintero on 2/18/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupNavBar()

        // Do any additional setup after loading the view.
    }
    
    // MARK: View Setups
    func setupNavBar(){
        navigationItem.title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }
    
    @objc func editButtonTapped(){
        print("Left bar button tapped")
    }
    

 

}

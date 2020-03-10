//
//  AddDebtVC.swift
//  byeDebt
//
//  Created by Andres Quintero on 3/10/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class AddDebtVC: UIViewController {
    let debtNameLabel = UILabel()
    let debtNameTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        setupNavBar()
        
        setupDebtNameLabel()
        setupDebtTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupNavBar(){
        navigationItem.title = "Add Debt"
    }
    
    
    func setupDebtNameLabel() {
        view.addSubview(debtNameLabel)
        
        debtNameLabel.backgroundColor = .systemBlue
        debtNameLabel.text = "Debt Name"
        
        debtNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // Top is attached to the view.topAnchor
        NSLayoutConstraint.activate([
            debtNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            debtNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtNameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
    
    func setupDebtTextField(){
        view.addSubview(debtNameTextField)
        
        debtNameTextField.placeholder = "DEBT NAME TEXTFIELD"
        debtNameTextField.backgroundColor = .systemPink
        
        debtNameTextField.translatesAutoresizingMaskIntoConstraints = false
        // Top is attachde to the debtNameLabel.topAnchor
        NSLayoutConstraint.activate([
            debtNameTextField.topAnchor.constraint(equalTo: debtNameLabel.bottomAnchor),
            debtNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtNameTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.10)
        ])
        
    }
    
    
    

    

}

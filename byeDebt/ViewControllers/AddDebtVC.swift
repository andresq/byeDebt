//
//  AddDebtVC.swift
//  byeDebt
//
//  Created by Andres Quintero on 3/10/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class AddDebtVC: UIViewController {
    let debtNameLabel = BDLabel()
    let debtNameTextField = BDTextField()
    
    let debtBalanceLabel = BDLabel()
    let debtBalanceTextField = BDTextField()
    
    let debtRateLabel = BDLabel()
    let debtRateTextField = BDTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        setupNavBar()
        
        setupDebtNameLabel()
        setupDebtNameTextField()
        
        setupDebtBalanceLabel()
        setupDebtBalanceTextField()
        
        setupDebtRateLabel()
        setupDebtRateTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupNavBar(){
        navigationItem.title = "Add Debt"
    }
    
    // MARK: Debt Name
    func setupDebtNameLabel() {
        view.addSubview(debtNameLabel)
        
        debtNameLabel.backgroundColor = .systemBlue //DEBUGSTUFF
        debtNameLabel.text = "Debt Name"
        
        // Top is attached to the view.topAnchor
        NSLayoutConstraint.activate([
            debtNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            debtNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtNameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
    
    func setupDebtNameTextField(){
        view.addSubview(debtNameTextField)
        
        debtNameTextField.placeholder = "Apple Card"
        debtNameTextField.backgroundColor = .systemPink //DEBUGSTUFF
        
        // Top is attached to the debtNameLabel.topAnchor
        NSLayoutConstraint.activate([
            debtNameTextField.topAnchor.constraint(equalTo: debtNameLabel.bottomAnchor),
            debtNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtNameTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)
        ])
        
    }
    
    // MARK: Debt Balance
    func setupDebtBalanceLabel() {
        view.addSubview(debtBalanceLabel)
        
        debtBalanceLabel.text = "Debt balance"
        debtBalanceLabel.backgroundColor = .systemTeal //DEBUGSTUFF
        
        // Top is attached to DebtTextField.bottomAnchor
        NSLayoutConstraint.activate([
            debtBalanceLabel.topAnchor.constraint(equalTo: debtNameTextField.bottomAnchor, constant: 20),
            debtBalanceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtBalanceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtBalanceLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
    
    func setupDebtBalanceTextField(){
        view.addSubview(debtBalanceTextField)
        
        debtBalanceTextField.placeholder = "1322.00"
        debtBalanceTextField.keyboardType = .decimalPad
        debtBalanceTextField.backgroundColor = .systemRed //DEBUGSTUFF
        
        // Top is attached to DebtBalanceLabel.bottomAnchor
        NSLayoutConstraint.activate([
            debtBalanceTextField.topAnchor.constraint(equalTo: debtBalanceLabel.bottomAnchor),
            debtBalanceTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtBalanceTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtBalanceTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)
        ])
    }
    
    // MARK: Debt Rate
    func setupDebtRateLabel(){
        view.addSubview(debtRateLabel)
        
        debtRateLabel.text = "Debt Rate"
        debtRateLabel.backgroundColor = .systemIndigo // DEBUGSTUFF
        
        //Attached to debtBalanceTextField.bottomAnchor
        NSLayoutConstraint.activate([
            debtRateLabel.topAnchor.constraint(equalTo: debtBalanceTextField.bottomAnchor, constant: 20),
            debtRateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtRateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtRateLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
    
    func setupDebtRateTextField(){
        view.addSubview(debtRateTextField)
        
        debtRateTextField.placeholder = "2.3"
        debtRateTextField.keyboardType = .decimalPad
        debtRateTextField.backgroundColor = .systemOrange // DEBUGSTUFF
        
        NSLayoutConstraint.activate([
            debtRateTextField.topAnchor.constraint(equalTo: debtRateLabel.bottomAnchor),
            debtRateTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            debtRateTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            debtRateTextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)
        ])
    }
    
    
    

    

}

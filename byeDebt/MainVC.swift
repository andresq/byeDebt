//
//  MainVC.swift
//  byeDebt
//
//  Created by Andres Quintero on 2/6/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    let totalDebtView = UIView()
    let totalDebtLabel = UILabel()
    let debtsTableView = UITableView()
    
    var totalDebt = 9999
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavBar()
        setupTableView()
        setupTotalDebtView()
        
    }
    
    // MARK: View Setups
    
    func setupNavBar(){
        navigationItem.title = "Main"
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        navigationController?.navigationBar.backgroundColor = view.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarButtonTapped))
        
        navigationItem.leftBarButtonItem?.tintColor = .systemGreen
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
    }
    
    func setupTableView(){
        view.addSubview(debtsTableView)
        debtsTableView.dataSource = self // Where to look for protocol functions
        debtsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "debtCell")
        debtsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            debtsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            debtsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            debtsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            debtsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            ])
    }
    
    func setupTotalDebtView(){
        view.addSubview(totalDebtView)
        totalDebtView.addSubview(totalDebtLabel)
        totalDebtView.translatesAutoresizingMaskIntoConstraints = false
        totalDebtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //CurrencyFormatter maybe place in Debt model
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        let currencyString = currencyFormatter.string(from: NSNumber(value: totalDebt))!
        
        
        totalDebtView.backgroundColor = view.backgroundColor
        totalDebtLabel.text = "Total Debt: \(currencyString)" // Uses CurrencyFormatter
        totalDebtLabel.textColor = .systemRed
        
        NSLayoutConstraint.activate([
            totalDebtView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            totalDebtView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            totalDebtView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            totalDebtView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
            totalDebtView.topAnchor.constraint(equalTo: debtsTableView.bottomAnchor),
            
            totalDebtLabel.leadingAnchor.constraint(equalTo: totalDebtView.leadingAnchor, constant: 25),
            totalDebtLabel.centerYAnchor.constraint(equalTo: totalDebtView.centerYAnchor, constant: -10)
        ])
        
    }
    
    
    
    
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    
    
    // MARK: Selector functions
    @objc func leftBarButtonTapped(){
        print("Left bar button tapped")
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func rightBarButtonTapped(){
        print("Left bar button tapped")
    }
    

   

}

// TableView
extension MainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "debtCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)!"
        return cell
    }
    
    
}

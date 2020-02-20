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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        setupTotalDebtView()
        
    }
    
    // MARK: View Setups
    
    func setupNavBar(){
        navigationItem.title = "Main"
        navigationController?.navigationBar.barTintColor = .systemBackground
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
            debtsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
            ])
    }
    
    func setupTotalDebtView(){
        view.addSubview(totalDebtView)
        totalDebtView.addSubview(totalDebtLabel)
        totalDebtView.translatesAutoresizingMaskIntoConstraints = false
        totalDebtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        totalDebtView.backgroundColor = .secondarySystemBackground
        totalDebtLabel.text = "Total Debt: "
        
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
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "debtCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)!"
        return cell
    }
    
    
}

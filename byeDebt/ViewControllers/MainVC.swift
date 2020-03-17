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
    
    // Hardcoded Temp values
    var totalDebt = 9999.00
    var debts: [Debt] = [
        Debt(name: "Apple Red", balance: 245.67, minPayment: 25, rate: 26.21),
        Debt(name: "Amex Sapphire", balance: 1331.12, minPayment: 25, rate: 3.21),
        Debt(name: "Chase Red", balance: 141.24, minPayment: 25, rate: 1.21),
        Debt(name: "Chase Gold", balance: 1414.35, minPayment: 25, rate: 14.21),
        Debt(name: "Apple Sapphire", balance: 657.33, minPayment: 25, rate: 21.21),
        Debt(name: "Apple Gold", balance: 101.34, minPayment: 25, rate: 21.21),
        Debt(name: "Amex Platinum", balance: 1231.12, minPayment: 25, rate: 3.21),
        Debt(name: "Chase Black", balance: 11.24, minPayment: 25, rate: 1.21),
        Debt(name: "Chase Green", balance: 1414.35, minPayment: 25, rate: 14.21),
        Debt(name: "Apple Platinum", balance: 657.33, minPayment: 25, rate: 21.21),
        Debt(name: "Apple Blue", balance: 245.67, minPayment: 25, rate: 23.21),
        Debt(name: "Apple Tin", balance: 101.34, minPayment: 25, rate: 21.21)
    ].sorted(by: >)
    
    

    var totalBalance = 0.0 {
        didSet{
            totalDebtLabel.text = "Total Debt: \(Debt.getStringCurrency(of: totalBalance))"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupNavBar()
        setupTableView()
        setupTotalDebtView()
        
        //TEMP
        for debt in debts {
            totalBalance += debt.balance
        }//END OF LOOP
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    // MARK: View Setups
    
    func setupNavBar(){
        navigationItem.title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        
        let addDebtButton = UIImage(systemName: "plus.square")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: addDebtButton, style: .plain, target: self, action: #selector(rightBarButtonTapped))

    }
    
    func setupTableView(){
        view.addSubview(debtsTableView)
        debtsTableView.dataSource = self // Where to look for protocol functions
        debtsTableView.register(DebtCell.self, forCellReuseIdentifier: "DebtCell")
        debtsTableView.rowHeight = 100 // Is there a way to put this in DebtCell?
        debtsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            debtsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            debtsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            debtsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            debtsTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.925)
            ])
    }
    
    func setupTotalDebtView(){
        view.addSubview(totalDebtView)
        totalDebtView.addSubview(totalDebtLabel)
        totalDebtView.translatesAutoresizingMaskIntoConstraints = false
        totalDebtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let currencyString = Debt.getStringCurrency(of: totalBalance)
        
        
        totalDebtView.backgroundColor = view.backgroundColor
        totalDebtLabel.text = "Total Debt: \(currencyString)" // Uses CurrencyFormatter
        totalDebtLabel.textColor = .systemRed
        
        NSLayoutConstraint.activate([
            totalDebtView.topAnchor.constraint(equalTo: debtsTableView.bottomAnchor),
            totalDebtView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            totalDebtView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            totalDebtView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
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
        print("Right bar button tapped")
        let addDebtVC = AddDebtVC()
        navigationController?.pushViewController(addDebtVC, animated: true)
    }
    

   

}

// TableView
extension MainVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DebtCell", for: indexPath) as! DebtCell
        
        //Temp cell info from hardcoded debt array
        let debt = debts[indexPath.row]
        
        let balanceString = Debt.getStringCurrency(of: debt.balance)
        var nextPayment = debt.balance * debt.dailyRate
        // Payments min is usually atleast 25
        if nextPayment < 25 {nextPayment = 25}
        
        let paymentString = Debt.getStringCurrency(of: nextPayment)
        let rateString = NSString(format: "%.2f", debt.rate) as String
        
        cell.debtNameLabel.attributedText = NSAttributedString(string: debt.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        cell.debtBalanceLabel.text = "Balance: \(balanceString)"
        cell.debtNextPaymentLabel.text = "Next Payment: \(paymentString)"
        cell.rateLabel.text = "Rate: \(rateString)%"
        
        // End of temp info
        
        return cell
    }
    
    
}

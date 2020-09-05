//
//  TableViewCell.swift
//  byeDebt
//
//  Created by Andres Quintero on 2/21/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class DebtCell: UITableViewCell {
    static let reuseID = "DebtCell"
    
    // This is the data that will be shown in the cell (Name, Balance, Next payment?)
    var debtNameLabel = UILabel()
    var debtBalanceLabel = UILabel()
    var debtNextPaymentLabel = UILabel()
    var rateLabel = UILabel()
    var dueDateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(debtNameLabel)
        addSubview(debtBalanceLabel)
        addSubview(debtNextPaymentLabel)
        addSubview(rateLabel)
        addSubview(dueDateLabel)
        
        // How they'll look in a cell
        setupLabelViews()
        configureLabelViews()
    }
    
    // This has to here for use in storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabelViews(){
//        dueDateLabel.textColor = .systemRed
    }
    
    func setupLabelViews() {
        for label in [debtNameLabel, debtBalanceLabel, debtNextPaymentLabel, rateLabel, dueDateLabel] {
            // Enables AutoLayout
            label.translatesAutoresizingMaskIntoConstraints = false
            // Text will take any amount of lines it needs to display
            label.numberOfLines = 0
            // Should conform to any font
            label.adjustsFontSizeToFitWidth = true
        }
    
        
        
        NSLayoutConstraint.activate([
            debtNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            debtNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            debtNameLabel.heightAnchor.constraint(equalToConstant: 20), // Note: Row Height is set to 50
            
            debtBalanceLabel.topAnchor.constraint(equalTo: debtNameLabel.bottomAnchor),
            debtBalanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            debtBalanceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            rateLabel.topAnchor.constraint(equalTo: debtBalanceLabel.bottomAnchor),
            rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            rateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            debtNextPaymentLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5),
            debtNextPaymentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            debtNextPaymentLabel.heightAnchor.constraint(equalToConstant: 40),
            
            dueDateLabel.topAnchor.constraint(equalTo: debtNextPaymentLabel.bottomAnchor),
            dueDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            dueDateLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        
    }
    
}

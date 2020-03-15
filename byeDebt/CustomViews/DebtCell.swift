//
//  TableViewCell.swift
//  byeDebt
//
//  Created by Andres Quintero on 2/21/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class DebtCell: UITableViewCell {
    
    // This is the data that will be shown in the cell (Name, Balance, Next payment?)
    var debtNameLabel = UILabel()
    var debtBalanceLabel = UILabel()
    var debtNextPaymentLabel = UILabel()
    var rateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(debtNameLabel)
        addSubview(debtBalanceLabel)
        addSubview(debtNextPaymentLabel)
        addSubview(rateLabel)
        
        // How they'll look in a cell
        setupLabelViews()
    }
    
    // This has to here for use in storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelViews() {
        for label in [debtNameLabel, debtBalanceLabel, debtNextPaymentLabel, rateLabel] {
            // Enables AutoLayout
            label.translatesAutoresizingMaskIntoConstraints = false
            // Text will take any amount of lines it needs to display (average should be 1 or 2)
            label.numberOfLines = 0
            // Should conform to any font
            label.adjustsFontSizeToFitWidth = true
        }
        
        
        // FIXME: use NSLayoutConstraints.constraints[]
        debtNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        debtNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        debtNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true // Note: Row Height is set to 50
        
        debtBalanceLabel.topAnchor.constraint(equalTo: debtNameLabel.bottomAnchor).isActive = true
        debtBalanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        debtBalanceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rateLabel.topAnchor.constraint(equalTo: debtBalanceLabel.bottomAnchor).isActive = true
        rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        rateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        debtNextPaymentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //debtNextPaymentLabel.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        debtNextPaymentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        debtNextPaymentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
}

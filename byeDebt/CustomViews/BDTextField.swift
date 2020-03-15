//
//  BDTextField.swift
//  byeDebt
//
//  Created by Andres Quintero on 3/15/20.
//  Copyright © 2020 Andres Quintero. All rights reserved.
//

import UIKit

class BDTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // Need for storyboard implementation
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        // Allows AutoLayout
        translatesAutoresizingMaskIntoConstraints = false
        
        // Rounded Corners
        layer.cornerRadius = 10
        
        textColor = .label
        tintColor = .label
        textAlignment = .natural
        font = UIFont.preferredFont(forTextStyle: .title2)
        // Shrinks text if the input gets long
        adjustsFontSizeToFitWidth = true
        
        backgroundColor = .tertiarySystemBackground
        // Disables autocorrect
        autocorrectionType = .no
        
        
        //Keybaord
        returnKeyType = .done
    }
    
    // Needed to add padding
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }

}

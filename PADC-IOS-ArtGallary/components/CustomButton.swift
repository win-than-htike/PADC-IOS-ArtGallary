//
//  CustomButton.swift
//  BackToSchool
//
//  Created by Sargon Zi on 11/30/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
    
}

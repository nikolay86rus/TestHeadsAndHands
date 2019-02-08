//
//  AppTextField.swift
//  HeadAndHandsTest
//
//  Created by Nikolay Sabadash on 07/02/2019.
//  Copyright © 2019 NikiSaaab. All rights reserved.
//

import UIKit

class AppTextField: UITextField {

    override func draw(_ rect: CGRect) {
        
        let underline = CALayer()
        let width: CGFloat = 1
        underline.frame = CGRect(x: 0, y: frame.height - width, width:  frame.width, height: width)
        underline.backgroundColor = UIColor.veryLightPink.cgColor
        self.layer.addSublayer(underline)
    }

}

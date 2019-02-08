//
//  AppButton.swift
//  HeadAndHandsTest
//
//  Created by Nikolay Sabadash on 07/02/2019.
//  Copyright © 2019 NikiSaaab. All rights reserved.
//

import UIKit

class AppButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            switch isEnabled {
            case true: alpha = 1
            case false: alpha = 0.6
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = .tangerine
        setTitleColor(.white, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        guard let titleLabel = titleLabel else { return }
        titleLabel.font = UIFont.app(font: .SFUITextMedium, size: 15)
    }

}

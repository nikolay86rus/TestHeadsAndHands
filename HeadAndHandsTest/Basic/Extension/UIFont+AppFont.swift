//
//  UIFont+AppFont.swift
//  HeadAndHandsTest
//
//  Created by Nikolay Sabadash on 07/02/2019.
//  Copyright © 2019 NikiSaaab. All rights reserved.
//

import UIKit

extension UIFont {
    enum AppFont: String {
        case SFUITextMedium = "SFUIText-Medium"
        case SFUITextRegular = "SFUIText-Regular"
    }
    
    static func app(font: AppFont, size: CGFloat) -> UIFont {
        guard let appFont = UIFont(name: font.rawValue, size: size) else {
            fatalError("""
                Failed to load the "\(font.rawValue)" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """)
        }
        return appFont
    }
}

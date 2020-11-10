//
//  UIFont + Extension.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 09.11.2020.
//

import Foundation
import UIKit

extension UIFont {
    static func openSansRegular(fontSize: CGFloat) -> UIFont? {
        let font = UIFont(name: "OpenSans-Regular", size: fontSize)
        print("regular == nil \(font == nil)")
        return font
    }
    
    static func openSansSemibold(fontSize: CGFloat) -> UIFont? {
        print("semibold")
        print(UIFont(name: "OpenSans-Semibold", size: fontSize) == nil)
        return UIFont(name: "OpenSans-Semibold", size: fontSize)
    }
}

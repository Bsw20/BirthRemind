//
//  UINavigationBar + Extension.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 04.11.2020.
//

import Foundation
import UIKit

extension UINavigationBar {
    var wholeHeight: CGFloat {
        frame.height + UIApplication.shared.statusBarFrame.height
    }
}

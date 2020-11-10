//
//  CheckBox.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 04.11.2020.
//

import Foundation
import UIKit

class CheckBox: UIImageView {
    let checkedImage = UIImage(systemName: "checkmark.circle.fill")
    let uncheckedImage = UIImage(systemName: "checkmark.circle")
    
    public var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                image = checkedImage
                image = image?.withRenderingMode(.alwaysTemplate)

            } else {
                image = uncheckedImage
                image = image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    
    func configure(with value: Bool) {
        self.isChecked = value
        backgroundColor = .clear
    }
    
}

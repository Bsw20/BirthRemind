//
//  BordersRoundedButton.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

class BordersRoundedButton: UIButton {
    init(text: String, bordersColor: UIColor, textColor: UIColor, cornerRadius: CGFloat = 5, borderWidth: Int = 1 ) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        roundBorders(borderColor: bordersColor, cornerRadius: cornerRadius, borderWidth: borderWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

//
//  CustomPageControl.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 02.11.2020.
//

import Foundation
import UIKit

class CustomPageControl: UIPageControl {
    init(currentPage: Int) {
        print("init")
        super.init(frame: .zero)
        numberOfPages = 3
        self.currentPage = currentPage
//        self.currentPageIndicatorTintColor = #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1)
//        customPageControl(dotFillColor: .orange, dotBorderColor: .green, dotBorderWidth: 2)
        pageIndicatorTintColor = .yellow
        currentPageIndicatorTintColor = #colorLiteral(red: 0.6980392157, green: 0.6980392157, blue: 0.6980392157, alpha: 1)
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
//    var borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//
//    override var currentPage: Int {
//        didSet {
//            updateBorderColor()
//        }
//    }

//    func updateBorderColor() {
//        print("updating")
//        print(subviews.count)
//        subviews.enumerated().forEach { index, subview in
//            if index != currentPage {
//                subview.layer.borderColor = UIColor.yellow.cgColor
//                subview.layer.borderWidth = 2
//                print(index)
//            } else {
//                subview.layer.borderWidth = 0
//                print(index)
//            }
//        }
//    }
//
//    func customPageControl(dotFillColor:UIColor, dotBorderColor:UIColor, dotBorderWidth:CGFloat) {
//        for (pageIndex, dotView) in self.subviews.enumerated() {
//            if self.currentPage == pageIndex {
//                dotView.backgroundColor = dotFillColor
//                dotView.layer.cornerRadius = dotView.frame.size.height / 2
//            }else{
//                dotView.backgroundColor = .clear
//                dotView.layer.cornerRadius = dotView.frame.size.height / 2
//                dotView.layer.borderColor = dotBorderColor.cgColor
//                dotView.layer.borderWidth = dotBorderWidth
//            }
//        }
//    }
    
}

//
//  Globals.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

var appCoordinator: AppCoordinator!

func onMainThread(delay: TimeInterval = 0, _ block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) { block() }
}

enum ImportResourse: Int, CaseIterable {
    case VK
    case Contacts
    
    func resourseImage() -> UIImage {
        switch self {
         
        case .VK:
            return UIImage(named: "Vk")!
        case .Contacts:
            return UIImage(named: "Contacts")!
        }
    }
    
    func description() -> String {
        switch self {
        
        case .VK:
            return "Import from VK"
        case .Contacts:
            return "Import contacts"
        }
    }
    
    func relatedColor() -> UIColor {
        switch self {
            
        case .VK:
            return #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        case .Contacts:
            return #colorLiteral(red: 0.6156862745, green: 0.3764705882, blue: 1, alpha: 1)
        }
    }
}

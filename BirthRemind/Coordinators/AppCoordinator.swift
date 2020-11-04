//
//  AppCoordinator.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

class AppCoordinator {
    let contentWindow: UIWindow
    
    init(window: UIWindow) {
//        contentWindow = UIWindow(frame: UIScreen.main.bounds)
        contentWindow = window
    }
    
    func startPresentation() {
        let presentationCoordinator = PresentationFlowCoordinator(window: contentWindow)
        presentationCoordinator.start()
    }
}

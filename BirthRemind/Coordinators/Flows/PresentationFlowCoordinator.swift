//
//  PresentationFlowCoordinator.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit
import Then
class PresentationFlowCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let startPresentationVC = StartPresentationViewController()
        let navigationController = UINavigationController(rootViewController: startPresentationVC).then { (vc) in
            Router.instance.navigationViewController = vc
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

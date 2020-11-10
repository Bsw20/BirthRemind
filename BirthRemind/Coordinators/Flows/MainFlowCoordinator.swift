//
//  MainFlowCoordinator.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 03.11.2020.
//

import Foundation
import UIKit

class MainFlowCoordinator {
    private let window: UIWindow
    private lazy var FriendViewController: FriendsPresentationViewController = {
        let vc = FriendsPresentationViewController()
        return vc
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let mainVC = MainAppViewController()
        let navigationController = UINavigationController(rootViewController: mainVC).then { (vc) in
            Router.instance.navigationViewController = vc
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

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
    private lazy var FriendViewController: FriendsPresentationViewController = {
        let vc = FriendsPresentationViewController()
        vc.coordinatorDelegate = self
        return vc
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let startPresentationVC = ImportPresentationViewController()
        let navigationController = UINavigationController(rootViewController: startPresentationVC).then { (vc) in
            Router.instance.navigationViewController = vc
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    

    
    
}

extension PresentationFlowCoordinator: FriendsControllerDelegate {
    func controllerDidFinish(_ controller: FriendsPresentationViewController) {
        print(#function)
    }
    
    
}

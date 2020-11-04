//
//  Router.swift
//  BirthRemind
//
//  Created by Ярослав Карпунькин on 02.11.2020.
//

import UIKit

class Router: NSObject {
    
    // MARK: - Variables public
    
    var navigationViewController: UINavigationController! {
        didSet {
            navigationViewController.interactivePopGestureRecognizer?.delegate = self
            navigationViewController.delegate = self
        }
    }
    
    // MARK: - Class methods
    
    static let instance = Router()
    
    // MARK: - Public methods
    
    func show(_ controller: UIViewController, animated: Bool = true) {
        pushScreen(controller, animated: animated)
    }
    
    func present(_ controller: UIViewController) {
        presentScreen(controller, animated: true)
    }
    
    // MARK: - Public methods
    
    func goBack() {
        if let topController = navigationViewController.topViewController {
            if topController.presentedViewController != nil {
                if let embeddedNc = topController.presentedViewController as? UINavigationController {
                    if embeddedNc.children.count == 1 {
                        embeddedNc.dismiss(animated: true, completion: nil)
                    } else {
                        embeddedNc.popViewController(animated: true)
                    }
                } else {
                    topController.dismiss(animated: true, completion: nil)
                }
                return
            } else {
                navigationViewController.popViewController(animated: true)
                return
            }
        }
        navigationViewController.popViewController(animated: true)
    }

    @discardableResult
    func goBackToController<T>(type: T.Type) -> T? {
        var searchController: T?
        
        if let presentedViewController = navigationViewController.presentedViewController {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
        
        navigationViewController.viewControllers.forEach { controller in
            if controller.classForCoder == type {
                searchController = controller as? T
            }
        }
        
        let navViewControllers = navigationViewController.viewControllers
        
        if let searchController = searchController as? UIViewController,
            let index = navViewControllers.firstIndex(of: searchController) {
            
            let newViewControllers = Array(navViewControllers[0...index])
            navigationViewController.setViewControllers(newViewControllers, animated: true)
        }
        
        return searchController
    }

    func goBackToRootController() {
        navigationViewController.popToRootViewController(animated: true)
    }

    func removeScreenFromStack<T>(_ screenType: T.Type) {
        navigationViewController.viewControllers.removeAll { $0.classForCoder == screenType }
    }
    
    func setupAsBaseScreen(_ controller: UIViewController, animated: Bool) {
        navigationViewController.setViewControllers([controller], animated: animated)
    }
    
    // MARK: - Private methods
    

    
    private func pushScreen(_ controller: UIViewController, animated: Bool) {
        navigationViewController.pushViewController(controller, animated: animated)
    }
    
    private func presentScreen(_ controller: UIViewController, animated: Bool) {
        navigationViewController.present(controller, animated: animated, completion: nil)
    }
}

extension Router: UINavigationControllerDelegate { }

extension Router: UIGestureRecognizerDelegate { }

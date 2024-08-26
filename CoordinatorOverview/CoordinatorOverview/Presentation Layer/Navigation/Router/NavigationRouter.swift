//
//  NavigationRouter.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import UIKit

// MARK: - NavigationRouter

/// A `Router` that knows how to do horizontal (push based) presentation.
final class NavigationRouter: NSObject {
    
    // MARK: Private Properties
    
    private let navigationController: UINavigationController
    private let rootViewController: UIViewController?
    
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    // MARK: Lifecycle
    
    init(
        navigationController: UINavigationController,
        onRootViewControllerDismissed: (() -> Void)? = nil)
    {
        self.navigationController = navigationController
        
        let rootViewController = navigationController.viewControllers.first
        self.rootViewController = rootViewController
        
        if let rootViewController {
            onDismissForViewController[rootViewController] = onRootViewControllerDismissed
        }
        
        super.init()
        
        navigationController.delegate = self
    }
}

// MARK: - RouterProtocol

extension NavigationRouter: RouterProtocol {
    
    // MARK: Internal Methods
    
    func present(
        _ viewController: UIViewController,
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        guard let rootViewController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        
        performOnDismissed(for: rootViewController)
        navigationController.popToViewController(rootViewController, animated: animated)
    }
    
    // MARK: Private Methods
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

// MARK: - UINavigationControllerDelegate

extension NavigationRouter: UINavigationControllerDelegate {
    
    // MARK: Internal Methods
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool)
    {
        guard
            let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(dismissedViewController)
        else {
            return
        }
        
        performOnDismissed(for: dismissedViewController)
    }
}

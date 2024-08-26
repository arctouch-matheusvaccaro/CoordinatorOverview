//
//  ModalNavigationRouter.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import UIKit

// MARK: - ModalNavigationRouter

/// A `Router` that knows how to do vertical (modal based) presentation.
final class ModalNavigationRouter: NSObject {
    
    // MARK: Internal Properties
    
    unowned let parentViewController: UIViewController
    
    // MARK: Private Properties
    
    private let navigationController: UINavigationController = UINavigationController()
    
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    // MARK: Lifecycle
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        
        super.init()
        
        navigationController.delegate = self
    }
}

// MARK: - RouterProtocol

extension ModalNavigationRouter: RouterProtocol {
    
    // MARK: Internal Methods
    
    func present(
        _ viewController: UIViewController,
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        onDismissForViewController[viewController] = onDismissed
        
        if navigationController.viewControllers.isEmpty {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func dismiss(animated: Bool) {
        let firstViewController = navigationController.viewControllers.first!
        performOnDismissed(for: firstViewController)
        
        parentViewController.dismiss(animated: animated)
    }
    
    // MARK: Private Methods
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addCancelButton(to: viewController)
        
        navigationController.setViewControllers([viewController], animated: false)
        
        parentViewController.present(navigationController, animated: animated)
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(didTapCancel))
    }
    
    @objc
    private func didTapCancel() {
        performOnDismissed(for: navigationController.viewControllers.first!)
        dismiss(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

// MARK: - UINavigationControllerDelegate

extension ModalNavigationRouter: UINavigationControllerDelegate {
    
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

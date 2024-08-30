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
    
    let navigationController: UINavigationController = UINavigationController()
    
    unowned let parentViewController: UIViewController
    
    // MARK: Private Properties
    
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    // MARK: Lifecycle
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        
        super.init()
        
        navigationController.delegate = self
        navigationController.presentationController?.delegate = self
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
        performOnDismissForAllViewControllers()
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
        dismiss(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
    
    /// Perform `onDismissed` action for every `UIViewController` that was dismissed indirectly.
    ///
    /// This method is useful to ensure all View Controllers had their `onDismissed` action called when they're dismissed from the Back Button's Menu.
    private func performOnDismissedForSilentlyDismissedViewControllers() {
        let viewControllersWithDismissActions = onDismissForViewController.keys
        let forgottenViewControllers = viewControllersWithDismissActions.filter {
            !navigationController.viewControllers.contains($0)
        }
        
        for forgottenViewController in forgottenViewControllers {
            performOnDismissed(for: forgottenViewController)
        }
    }
    
    private func performOnDismissForAllViewControllers() {
        for viewControllerToDismiss in onDismissForViewController.keys {
            performOnDismissed(for: viewControllerToDismiss)
        }
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
            let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from)
        else {
            return
        }
        
        let isMovingBackFromNavigation = !navigationController.viewControllers.contains(dismissedViewController)
        
        if isMovingBackFromNavigation {
            performOnDismissed(for: dismissedViewController)
            performOnDismissedForSilentlyDismissedViewControllers()
        }
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension ModalNavigationRouter: UIAdaptivePresentationControllerDelegate {
    
    // MARK: Internal Methods
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        performOnDismissForAllViewControllers()
    }
}

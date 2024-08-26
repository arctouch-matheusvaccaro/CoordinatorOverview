//
//  AppDelegateRouter.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import UIKit

// MARK: - AppDelegateRouter

/// A specialized `Router` responsible for starting the presentation flow in `UIKit` based apps.
final class AppDelegateRouter: RouterProtocol {
    
    // MARK: Internal Properties
    
    let window: UIWindow
    
    var topViewController: UIViewController? {
        window.rootViewController
    }
    
    // MARK: Lifecyclce
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Internal Methods
    
    func present(
        _ viewController: UIViewController,
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func dismiss(animated: Bool) {
        assertionFailure("AppDelegateRouter cannot be dismissed because it presents the key window of the app.")
    }
}

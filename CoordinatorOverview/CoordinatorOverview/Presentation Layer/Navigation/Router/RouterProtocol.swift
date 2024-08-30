//
//  RouterProtocol.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import UIKit

// MARK: - RouterProtocol

protocol RouterProtocol: AnyObject {
    
    // MARK: Internal Properties
    
    var topViewController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    
    // MARK: Internal Methods
    
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
}

// MARK: - Default Implementations

extension RouterProtocol {
    
    // MARK: Internal Properties
    
    var topViewController: UIViewController? {
        navigationController.topViewController
    }
    
    // MARK: Internal Methods
    
    func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
}

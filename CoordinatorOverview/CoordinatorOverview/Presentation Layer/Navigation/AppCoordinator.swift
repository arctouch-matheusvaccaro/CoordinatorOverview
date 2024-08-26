//
//  AppCoordinator.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import SwiftUI

// MARK: - AppCoordinator

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: Internal Properties
    
    let router: RouterProtocol
    
    var children: [CoordinatorProtocol] = []
    
    // MARK: Lifecycle
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: Internal Methods
    
    func present(
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        presentHomeCoordinator(
            animated: animated,
            onDismissed: onDismissed)
    }
    
    // MARK: Private Methods
    
    private func presentHomeCoordinator(
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        let homeCoordinator = HomeCoordinator(router: router)
        
        presentChild(
            homeCoordinator,
            animated: animated,
            onDismissed: onDismissed)
    }
}

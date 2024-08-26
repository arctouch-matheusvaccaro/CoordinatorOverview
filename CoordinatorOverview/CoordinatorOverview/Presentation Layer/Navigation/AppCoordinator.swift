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
    
    // MARK: Private Properties
    
//    private let requestManager: RequestManagerProtocol
    
    // MARK: Lifecycle
    
    init(router: RouterProtocol) {
        self.router = router
//        self.requestManager = UnauthenticatedRequestManager()
    }
    
    // MARK: Internal Methods
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
//        presentEarthquakeCoordinator(animated: animated)
    }
    
    // MARK: Private Methods
    
//    private func presentEarthquakeCoordinator(animated: Bool) {
//        let earthquakeCoordinator = EarthquakeCoordinator(
//            router: router,
//            requestManager: requestManager)
//        
//        presentChild(earthquakeCoordinator, animated: animated)
//    }
}

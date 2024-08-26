//
//  AppCoordinatorView.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import SwiftUI

// MARK: - AppCoordinatorView

struct AppCoordinatorView: UIViewControllerRepresentable {
    
    // MARK: Type Alias
    
    typealias UIViewControllerType = UINavigationController
    
    // MARK: Private Properties
    
    private let navigationController: UINavigationController
    private let router: RouterProtocol
    private let appCoordinator: CoordinatorProtocol
    
    // MARK: Lifecycle
    
    init() {
        self.navigationController = UINavigationController()
        
        self.router = NavigationRouter(navigationController: navigationController)
        
        self.appCoordinator = AppCoordinator(router: router)
        appCoordinator.present(animated: false)
    }
    
    // MARK: Internal Methods
    
    func makeUIViewController(context: Context) -> UINavigationController {
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        /* no-op */
    }
}

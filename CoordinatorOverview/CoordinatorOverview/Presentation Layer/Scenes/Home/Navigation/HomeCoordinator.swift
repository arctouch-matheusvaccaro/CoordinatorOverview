//
//  HomeCoordinator.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation
import SwiftUI

// MARK: - HomeCoordinator

final class HomeCoordinator: CoordinatorProtocol {

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
        presentHome(
            animated: animated,
            onDismissed: onDismissed)
    }
    
    // MARK: Private Methods
    
    private func presentHome(
        animated: Bool = true,
        onDismissed: (() -> Void)?)
    {
        let homeViewModel = HomeViewModel(delegate: self)
        let homeView = HomeView(viewModel: homeViewModel)
        
        let hostingController = UIHostingController(rootView: homeView)
        
        router.present(
            hostingController,
            animated: animated,
            onDismissed: onDismissed)
    }
}

// MARK: - HomeViewModelDelegate

extension HomeCoordinator: HomeViewModelDelegate {
    
    // MARK: Internal Methods
    
    func viewModel(_ viewModel: HomeViewModel, didSelectOption option: HomeListOption) {
        print("Something")
    }
    
    func didSelectSettingsButton(in viewModel: HomeViewModel) {
        print("Other thing")
    }
}

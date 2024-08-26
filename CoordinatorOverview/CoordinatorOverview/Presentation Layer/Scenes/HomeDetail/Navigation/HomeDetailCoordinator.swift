//
//  HomeDetailCoordinator.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation
import SwiftUI

// MARK: - HomeDetailCoordinator

final class HomeDetailCoordinator: CoordinatorProtocol {
   
    // MARK: Internal Properties
        
    let router: RouterProtocol
    
    var children: [CoordinatorProtocol] = []
    
    // MARK: Private Properties
    
    private let homeListOption: HomeListOption
    
    // MARK: Lifecycle
    
    init(
        homeListOption: HomeListOption,
        router: RouterProtocol)
    {
        self.homeListOption = homeListOption
        self.router = router
    }
    
    // MARK: Internal Methods
    
    func present(
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        presentHomeDetail(
            for: homeListOption,
            animated: animated,
            onDismissed: onDismissed)
    }
    
    // MARK: Private Methods
    
    private func presentHomeDetail(
        for homeListOption: HomeListOption,
        animated: Bool = true,
        onDismissed: (() -> Void)?)
    {
        let homeDetailViewModel = HomeDetailViewModel(homeListOption: homeListOption)
        let homeDetailView = HomeDetailView(viewModel: homeDetailViewModel)
        
        let hostingController = UIHostingController(rootView: homeDetailView)
        
        router.present(
            hostingController,
            animated: animated,
            onDismissed: onDismissed)
    }
}

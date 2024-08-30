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
    
    private let initialScreenIndex = 1
    private let totalNumberOfScreens = 3
    private var currentScreenIndex: Int
    
    // MARK: Lifecycle
    
    init(
        homeListOption: HomeListOption,
        router: RouterProtocol)
    {
        self.homeListOption = homeListOption
        self.router = router
        self.currentScreenIndex = initialScreenIndex
    }
    
    // MARK: Internal Methods
    
    func present(
        animated: Bool,
        onDismissed: (() -> Void)?)
    {
        presentHomeDetail(
            forScreenIndex: initialScreenIndex,
            animated: animated,
            onDismissed: onDismissed)
    }
    
    // MARK: Private Methods
    
    private func presentHomeDetail(
        forScreenIndex screenIndex: Int,
        animated: Bool = true,
        onDismissed: (() -> Void)? = nil)
    {
        let homeDetailViewModel = HomeDetailViewModel(
            navigationTitle: makeNavigationTitleForScreen(at: screenIndex),
            delegate: self)
        
        let homeDetailView = HomeDetailView(viewModel: homeDetailViewModel)
        
        let hostingController = UIHostingController(rootView: homeDetailView)
        
        router.present(
            hostingController,
            animated: animated,
            onDismissed: onDismissed)
    }
    
    private func makeNavigationTitleForScreen(at index: Int) -> String {
        "Screen \(index)"
    }
}

// MARK: - HomeDetailViewModelDelegate

extension HomeDetailCoordinator: HomeDetailViewModelDelegate {
    
    // MARK: Internal Methods
    
    func viewModelDidTapGoToNextScreen(_ viewModel: HomeDetailViewModel) {
        let nextScreenIndex = currentScreenIndex + 1
        
        guard nextScreenIndex <= totalNumberOfScreens else {
            return
        }
        
        currentScreenIndex = nextScreenIndex
        print("Current Screen Index updated to \(currentScreenIndex)")

        presentHomeDetail(
            forScreenIndex: currentScreenIndex,
            onDismissed: { [weak self] in
                self?.currentScreenIndex -= 1
                print("Current Screen Index updated to \(self?.currentScreenIndex ?? -1)")
            })
    }
}

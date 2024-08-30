//
//  MockHomeViewModel.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - MockHomeViewModel

final class MockHomeViewModel: HomeViewModelProtocol {
    
    // MARK: Internal Properties
    
    @Published var listOptions: [HomeListOption]
    
    // MARK: Lifecycle
    
    init() {
        listOptions = [
            .horizontalNavigation,
            .modalNavigation,
        ]
    }
    
    // MARK: Internal Methods
    
    func selectListOption(_ option: HomeListOption) {
        print("Selected Option: \(option.title)")
    }
    
    func selectSettingsButton() {
        print("Setting Button tapped")
    }
}

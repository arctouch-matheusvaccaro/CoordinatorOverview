//
//  MockHomeDetailViewModel.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - MockHomeDetailViewModel

final class MockHomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: Internal Properties
    
    let buttonTitle: String = "Go to Next Screen"
    
    
    @Published var navigationTitle: String
    
    // MARK: Lifecycle
    
    init() {
        navigationTitle = "Test"
    }
    
    // MARK: Internal Methods
    
    func goToNextScreen() {
        print("Tapped Go To Next Screen.")
    }
}

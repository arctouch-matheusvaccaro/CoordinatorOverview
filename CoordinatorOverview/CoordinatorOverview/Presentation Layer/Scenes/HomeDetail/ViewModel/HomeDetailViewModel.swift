//
//  HomeDetailViewModel.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeDetailViewModel

final class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: Internal Properties
    
    @Published var navigationTitle: String
    
    // MARK: Private Properties
    
    private let homeListOption: HomeListOption
    
    // MARK: Lifecycle
    
    init(homeListOption: HomeListOption) {
        self.homeListOption = homeListOption
        self.navigationTitle = homeListOption.title
    }
}

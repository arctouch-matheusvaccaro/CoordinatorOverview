//
//  HomeDetailViewModel.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeDetailViewModelDelegate

protocol HomeDetailViewModelDelegate: AnyObject {
    
    // MARK: Internal Methods
    
    func viewModelDidTapGoToNextScreen(_ viewModel: HomeDetailViewModel)
}

// MARK: - HomeDetailViewModel

final class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: Internal Properties
    
    @Published var navigationTitle: String
    
    // MARK: Private Properties
    
    private weak var delegate: HomeDetailViewModelDelegate?
    
    // MARK: Lifecycle
    
    init(navigationTitle: String, delegate: HomeDetailViewModelDelegate?) {
        self.navigationTitle = navigationTitle
        self.delegate = delegate
    }
    
    // MARK: Internal Methods
    
    func goToNextScreen() {
        delegate?.viewModelDidTapGoToNextScreen(self)
    }
}

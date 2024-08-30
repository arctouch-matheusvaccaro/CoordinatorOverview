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
    func viewModelDidTapDismiss(_ viewModel: HomeDetailViewModel)
}

// MARK: - HomeDetailViewModel

final class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: Internal Properties
    
    @Published var navigationTitle: String
    
    var buttonTitle: String {
        isLastScreen
            ? "Dismiss"
            : "Go to Next Screen"
    }
    
    // MARK: Private Properties
    
    private let isLastScreen: Bool
    
    private weak var delegate: HomeDetailViewModelDelegate?
    
    // MARK: Lifecycle
    
    init(
        navigationTitle: String,
        isLastScreen: Bool,
        delegate: HomeDetailViewModelDelegate?)
    {
        self.navigationTitle = navigationTitle
        self.isLastScreen = isLastScreen
        self.delegate = delegate
    }
    
    // MARK: Internal Methods
    
    func goToNextScreen() {
        isLastScreen
            ? delegate?.viewModelDidTapDismiss(self)
            : delegate?.viewModelDidTapGoToNextScreen(self)
    }
}

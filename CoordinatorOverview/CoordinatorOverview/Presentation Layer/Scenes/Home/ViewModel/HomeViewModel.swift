//
//  HomeViewModel.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeViewModelDelegate

protocol HomeViewModelDelegate: AnyObject {
    
    // MARK: Internal Methods
        
    func viewModel(_ viewModel: HomeViewModel, didSelectOption option: HomeListOption)
    func didSelectSettingsButton(in viewModel: HomeViewModel)
}

// MARK: - HomeViewModel

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Internal Properties
    
    @Published var listOptions: [HomeListOption]
    
    // MARK: Private Properties
    
    private weak var delegate: HomeViewModelDelegate?
    
    // MARK: Lifecycle
    
    init(delegate: HomeViewModelDelegate?) {
        self.listOptions = [
            .horizontalNavigation,
            .modalNavigation,
            .configurableNavigation
        ]
        
        self.delegate = delegate
    }
    
    // MARK: Internal Methods
    
    func selectListOption(_ option: HomeListOption) {
        delegate?.viewModel(self, didSelectOption: option)
    }
    
    func selectSettingsButton() {
        delegate?.didSelectSettingsButton(in: self)
    }
}

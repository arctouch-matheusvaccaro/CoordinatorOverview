//
//  HomeDetailViewModelProtocol.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeDetailViewModelProtocol

protocol HomeDetailViewModelProtocol: ObservableObject {
    
    // MARK: Internal Properties
    
    var navigationTitle: String { get }
    
    // MARK: Internal Methods
    
    func goToNextScreen()
}

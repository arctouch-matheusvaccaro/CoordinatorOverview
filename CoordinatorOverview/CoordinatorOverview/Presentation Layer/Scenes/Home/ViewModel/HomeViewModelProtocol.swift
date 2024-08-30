//
//  HomeViewModelProtocol.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeViewModelProtocol

protocol HomeViewModelProtocol: ObservableObject {
    
    // MARK: Internal Properties
    
    var listOptions: [HomeListOption] { get }
    
    // MARK: Internal Methods
    
    func selectListOption(_ option: HomeListOption)
}

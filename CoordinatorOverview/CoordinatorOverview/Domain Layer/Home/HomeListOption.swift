//
//  HomeListOption.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import Foundation

// MARK: - HomeListOption

enum HomeListOption: String {
    
    // MARK: Cases
    
    case horizontalNavigation = "Horizontal Navigation"
    case modalNavigation = "Modal Navigation"
    case configurableNavigation = "Configurable Navigation"
    
    // MARK: Internal Properties
    
    var title: String {
        self.rawValue
    }
}

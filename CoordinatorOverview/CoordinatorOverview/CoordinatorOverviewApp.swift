//
//  CoordinatorOverviewApp.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/16/24.
//

import SwiftUI

// MARK: - CoordinatorOverviewApp

@main
struct CoordinatorOverviewApp: App {
    
    // MARK: Body
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .ignoresSafeArea()
        }
    }
}

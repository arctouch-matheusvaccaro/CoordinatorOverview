//
//  HomeDetailView.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import SwiftUI

// MARK: - HomeDetailView

struct HomeDetailView<ViewModel: HomeDetailViewModelProtocol>: View {
    
    // MARK: Internal Properties
    
    @ObservedObject var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        Content(viewModel: viewModel)
            .navigationTitle(viewModel.navigationTitle)
    }
}

// MARK: - Content

private struct Content<ViewModel: HomeDetailViewModelProtocol>: View {
    
    // MARK: Internal Properties
    
    @ObservedObject var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        Text("Ayy")
    }
}

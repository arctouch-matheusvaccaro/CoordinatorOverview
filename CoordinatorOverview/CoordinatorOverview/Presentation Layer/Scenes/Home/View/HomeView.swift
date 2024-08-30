//
//  HomeView.swift
//  CoordinatorOverview
//
//  Created by Matheus Vaccaro on 8/26/24.
//

import SwiftUI

// MARK: - HomeView

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: Internal Properties
    
    @ObservedObject var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        ContentList(viewModel: viewModel)
            .navigationTitle("Home")
    }
}

// MARK: - ContentList

private struct ContentList<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: Internal Properties
    
    @ObservedObject var viewModel: ViewModel
    
    // MARK: Body
    
    var body: some View {
        List(viewModel.listOptions, id: \.self) { option in
            ListButton(
                title: option.title,
                action: {
                    viewModel.selectListOption(option)
                })
        }
    }
}

// MARK: - ListButton

private struct ListButton: View {
    
    // MARK: Internal Properties
    
    let title: String
    let action: (() -> Void)?
    
    // MARK: Body
    
    var body: some View {
        Button(
            action: {
                action?()
            },
            label: {
                HStack {
                    Text(title)
                    Spacer()
                    Image(systemName: "chevron.forward")
                }
            })
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        HomeView(viewModel: MockHomeViewModel())
    }
}

//
//  MainView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI

struct MainView: View {
    @Environment(\.navigate) private var navigate
    @StateObject var viewModel: MainViewModel
        
    var body: some View {
        List(viewModel.operators, id: \.self) { operatorItem in
            Button(
                action: {
                    navigate(.push(.detail(operatorItem)))
                },
                label: {
                    Text("\(operatorItem.title)")
                }
            )
        }
        Button(
            action: {
                viewModel.send(.addEmptyOperator)
            },
            label: {
                Text("Add Empty")
            }
        )
        .onAppear {
            viewModel.send(.loadData)
        }
        .navigationTitle("Combine Marbles")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    NavigationStack {
        MainView(
            viewModel: MainViewModel(
                container: DIContainer(
                    services: Services()
                )
            )
        )
    }
}

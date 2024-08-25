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
            HStack {
                
            }
        }
        .navigationTitle("Combine Marbles")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    NavigationStack {
        MainView(viewModel: MainViewModel())
    }
}

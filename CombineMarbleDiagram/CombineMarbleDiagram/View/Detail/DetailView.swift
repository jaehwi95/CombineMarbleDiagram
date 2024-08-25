//
//  DetailView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.navigate) private var navigate
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        Text("Detail View")
        Button(
            action: {
                navigate(.pop)
            },
            label: {
                Text("Go Back")
            }
        )
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel())
}

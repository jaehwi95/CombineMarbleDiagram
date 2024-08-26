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
        VStack {
            SliderView(nodes: .constant([
                SliderNode(color: .blue, text: "1", position: 0),
                SliderNode(color: .blue, text: "2", position: 50),
                SliderNode(color: .blue, text: "3", position: 100)
            ]))
            Text("Detail View")
            Button(
                action: {
                    navigate(.pop)
                },
                label: {
                    Text("\(viewModel.operatorItem.name)")
                }
            )
        }
    }
}

#Preview {
    DetailView(
        viewModel: DetailViewModel(
            operatorItem: Operator(
                id: "id_1",
                title: "title(_:)",
                name: "func title<T>(_ transform: @escaping (Self.Output) -> T) -> Publishers.Map<Self, T>",
                type: .mapping
            )
        )
    )
}

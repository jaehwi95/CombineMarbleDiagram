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
    
    @State private var nodes: [SliderNodeModel] = []
    
    var body: some View {
        VStack {
            SliderView(nodes: $nodes)
                .frame(height: 60)
            Button(
                action: {
                    addNode()
                },
                label: {
                    Text("Add Node")
                }
            )
            
//            CustomSliderView()
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
    
    func addNode() {
        let newNode = SliderNodeModel(
            color: Color.random(),
            text: "",
            positionScale: 0
        )
        nodes.append(newNode)
    }
}

public extension Color {
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
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

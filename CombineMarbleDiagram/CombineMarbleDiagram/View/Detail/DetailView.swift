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
            SliderView(nodes: $viewModel.nodes)
            HStack(spacing: 0) {
                Text(".map { $0 x ")
                TextField("", text: $viewModel.multiplier)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(viewModel.isValid ? Color.gray : Color.red, lineWidth: 1)
                    }
                    .frame(width: 40)
                    .onChange(of: viewModel.multiplier) { newValue in
                        viewModel.send(.validateInput(newInputString: newValue))
                    }
                Text(" }")
            }
            SliderResult(nodes: $viewModel.mappedNodes)
        }
        .padding(.horizontal, 20)
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

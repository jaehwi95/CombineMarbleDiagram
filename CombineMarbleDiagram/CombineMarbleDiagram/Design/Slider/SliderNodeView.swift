//
//  SliderNodeView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderNodeView: View {
    private let color: Color?
    private let text: String?
    private let isSelected: Bool
    
    init(color: Color?, text: String? = nil, isSelected: Bool = false) {
        self.color = color
        self.text = text
        self.isSelected = isSelected
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: 30, height: 30)
                .background(Circle().fill(self.color ?? .blue))
            if let text = text, !text.isEmpty {
                Text(text)
                    .font(.body)
                    .foregroundStyle(Color.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(4)
                    .frame(width: 30, height: 30)
            }
        }
        .scaleEffect(isSelected ? 1.2 : 1.0)
    }
}

#Preview {
    SliderNodeView(color: .marbleRed, text: "3")
}

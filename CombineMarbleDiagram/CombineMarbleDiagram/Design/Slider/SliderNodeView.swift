//
//  SliderNodeView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderNodeView: View {
    let color: Color?
    let text: String?
    
    init(color: Color?, text: String? = nil) {
        self.color = color
        self.text = text ?? ""
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
    }
}

#Preview {
    SliderNodeView(color: .red, text: "3")
}

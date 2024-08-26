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
    let size: CGFloat?
    
    init(color: Color?, text: String? = nil, size: CGFloat? = nil) {
        self.color = color
        self.text = text ?? ""
        self.size = size ?? 30
    }
    
    var body: some View {
        Circle()
            .stroke(.black, lineWidth: 2)
            .background(Circle().fill(.blue))
            .frame(width: self.size, height: self.size)
            .foregroundStyle(self.color ?? .blue)
    }
}

#Preview {
    SliderNodeView(color: .blue)
}

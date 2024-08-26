//
//  SliderView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderView: View {
    @Binding var nodes: [SliderNode]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                SliderLineView(lineWidth: 2)
                ForEach(nodes) { node in
                    SliderNodeView(color: .blue)
                }
            }
        }
    }
}

#Preview {
    SliderView(nodes: .constant([
        SliderNode(color: .blue, text: "1", position: 0),
        SliderNode(color: .blue, text: "2", position: 50),
        SliderNode(color: .blue, text: "3", position: 100)
    ]))
}

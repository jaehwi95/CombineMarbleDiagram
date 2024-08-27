//
//  SliderView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderView: View {
    @Binding var nodes: [SliderNodeModel]
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { geometry in
            let maxDraggableWidth = geometry.size.width * 0.9
            ZStack {
                SliderLineView(lineWidth: 2)
                ForEach($nodes, id: \.id) { $node in
                    SliderNodeView(color: isDragging ? Color.gray : node.color)
                        .position(x: maxDraggableWidth * node.positionScale, y: 30)
                        .gesture(
                            DragGesture()
                                .onChanged { dragGestureValue in
                                    isDragging = true
                                    let newValue = min(max(0, dragGestureValue.location.x / maxDraggableWidth), 1)
                                    node.positionScale = newValue
                                }
                                .onEnded { _ in
                                    isDragging = false
                                }
                        )
                        .animation(.easeInOut, value: node.positionScale)
                }
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    SliderView(nodes: .constant([
        SliderNodeModel(color: .red, text: "1", positionScale: 0.5),
    ]))
}

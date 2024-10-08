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
                ForEach(nodes.indices, id: \.self) { index in
                    SliderNodeView(
                        color: nodes[index].color,
                        text: nodes[index].text,
                        isSelected: nodes[index].isSelected
                    )
                    .position(x: maxDraggableWidth * nodes[index].positionScale, y: 30)
                    .gesture(
                        DragGesture()
                            .onChanged { dragGestureValue in
                                nodes[index].isSelected = true
                                let newValue = min(max(0, dragGestureValue.location.x / maxDraggableWidth), 1)
                                nodes[index].positionScale = newValue
                            }
                            .onEnded { _ in
                                nodes[index].isSelected = false
                            }
                    )
                }
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    @State var sliderNodeModels: [SliderNodeModel] = [
        SliderNodeModel(
            color: .marbleRed,
            text: "1",
            positionScale: 0.1),
        SliderNodeModel(
            color: .marbleYellow,
            text: "2",
            positionScale: 0.4),
        SliderNodeModel(
            color: .marbleBlue,
            text: "3",
            positionScale: 0.9)
    ]
    
    return SliderView(
        nodes: $sliderNodeModels
    )
}

//
//  SliderResultView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 9/7/24.
//

import SwiftUI

struct SliderResult: View {
    @Binding var nodes: [SliderNodeModel]
    
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
            positionScale: 0.5),
        SliderNodeModel(
            color: .marbleBlue,
            text: "1",
            positionScale: 0.9)
    ]
    
    return SliderResult(
        nodes: $sliderNodeModels
    )
}

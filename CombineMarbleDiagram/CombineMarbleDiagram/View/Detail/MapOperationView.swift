//
//  MapOperationView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 9/1/24.
//

import SwiftUI

struct MapOperationView: View {
    @State private var nodes: [SliderNodeModel] = [
        SliderNodeModel(
            color: .marbleBlue,
            text: "1",
            positionScale: 0.1),
        SliderNodeModel(
            color: .marbleYellow,
            text: "2",
            positionScale: 0.4),
        SliderNodeModel(
            color: .marbleRed,
            text: "3",
            positionScale: 0.7)
    ]
    
    var body: some View {
        VStack {
            SliderView(
                nodes: $nodes
            )
            .frame(height: 60)
        }
    }
}

#Preview {
    MapOperationView()
}

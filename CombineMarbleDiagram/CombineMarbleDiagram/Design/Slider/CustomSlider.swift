//
//  CustomSlider.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/27.
//

import SwiftUI

struct CustomSliderView: View {
    @State private var nodes: [Node] = []
    
    var body: some View {
        VStack {
            CustomSlider(nodes: $nodes)
                .frame(height: 60)
                .padding()
            
            Button(action: {
                addNode()
            }) {
                Text("Add Node")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    func addNode() {
        let newNode = Node(id: UUID(), value: 0.5)
        nodes.append(newNode)
    }
}

struct CustomSlider: View {
    @Binding var nodes: [Node]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 4)
                
                ForEach($nodes) { $node in
                    CustomSliderNodeView(node: $node, sliderWidth: geometry.size.width)
                }
            }
        }
    }
}

struct CustomSliderNodeView: View {
    @Binding var node: Node
    var sliderWidth: CGFloat
    
    @State private var isDragging = false
    
    var body: some View {
        Circle()
            .fill(isDragging ? Color.blue : Color.green)
            .frame(width: 30, height: 30)
            .position(x: sliderWidth * node.value, y: 30) // Adjust position here
            .gesture(
                DragGesture()
                    .onChanged { value in
                        isDragging = true
                        let newValue = min(max(0, value.location.x / sliderWidth), 1)
                        node.value = newValue
                    }
                    .onEnded { _ in
                        isDragging = false
                    }
            )
            .animation(.easeInOut, value: node.value)
    }
}

struct Node: Identifiable {
    let id: UUID
    var value: CGFloat // Value between 0 and 1 representing position on the slider
}

#Preview {
    CustomSliderView()
}

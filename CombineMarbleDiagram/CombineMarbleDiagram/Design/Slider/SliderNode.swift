//
//  SliderNode.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderNode: Identifiable {
    let id: UUID = UUID()
    let color: Color
    let text: String
    let position: CGFloat
    
    init(color: Color, text: String, position: CGFloat) {
        self.color = color
        self.text = text
        self.position = position
    }
}

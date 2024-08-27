//
//  SliderNodeModel.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderNodeModel: Identifiable {
    let id: UUID = UUID()
    let color: Color
    let text: String
    // Value between 0 and 1 representing position on the slider
    var positionScale: CGFloat
    
    init(color: Color, text: String, positionScale: CGFloat) {
        assert(0...1 ~= positionScale, "positionScale must be between 0 and 1")
        self.color = color
        self.text = text
        self.positionScale = positionScale
    }
}

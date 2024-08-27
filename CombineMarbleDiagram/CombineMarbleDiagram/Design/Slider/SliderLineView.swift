//
//  SliderLineView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderLineView: View {
    let lineWidth: CGFloat
    let isOnEnd: Bool?
    
    init(lineWidth: CGFloat, isOnEnd: Bool? = nil) {
        self.lineWidth = lineWidth
        self.isOnEnd = isOnEnd
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let totalWidth: CGFloat = geometry.size.width
                let barPosition: CGFloat = totalWidth * 0.9
                let viewHeight: CGFloat = geometry.size.height
                let centerY: CGFloat = viewHeight / 2
                
                path.move(to: CGPoint(x: 0, y: centerY))
                path.addLine(to: CGPoint(x: totalWidth, y: centerY))
                
                path.move(to: CGPoint(x: totalWidth - 10, y: centerY + 10))
                path.addLine(to: CGPoint(x: totalWidth, y: centerY))
                
                path.move(to: CGPoint(x: totalWidth - 10, y: centerY - 10))
                path.addLine(to: CGPoint(x: totalWidth, y: centerY))
                
                path.move(to: CGPoint(x: barPosition, y: centerY + 16))
                path.addLine(to: CGPoint(x: barPosition, y: centerY))
                
                path.move(to: CGPoint(x: barPosition, y: centerY - 16))
                path.addLine(to: CGPoint(x: barPosition, y: centerY))
            }
            .stroke(.black, lineWidth: self.lineWidth)
        }
        .frame(height: 60)
    }
}

#Preview {
    SliderLineView(lineWidth: 2)
}

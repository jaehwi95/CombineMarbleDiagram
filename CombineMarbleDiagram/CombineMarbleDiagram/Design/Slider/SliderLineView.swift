//
//  SliderLineView.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import SwiftUI

struct SliderLineView: View {
    let lineWidth: CGFloat
    
    init(lineWidth: CGFloat) {
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let totalWidth: CGFloat = geometry.size.width
                let barPosition: CGFloat = totalWidth * 0.8
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
        .frame(height: 50)
        .border(.red)
    }
}

#Preview {
    SliderLineView(lineWidth: 2)
}

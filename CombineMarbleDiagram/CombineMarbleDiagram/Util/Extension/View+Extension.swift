//
//  View+Extension.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI

extension View {
    /// 내비게이션에 필요한 Environment값을 주입
    func onNavigate(_ action: @escaping NavigationAction.Action) -> some View {
        self.environment(\.navigate, NavigationAction(action: action))
    }
}

/// SafeArea BottomPadding이 없는 기기 (ex. iPhone 8) 대응
private struct SafeAreaBottomPadding: ViewModifier {
    func body(content: Content) -> some View {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           window.safeAreaInsets.bottom == 0 {
            content.padding(.bottom)
        } else {
            content
        }
    }
}

extension View {
    func safeAreaBottomPadding() -> some View {
        modifier(SafeAreaBottomPadding())
    }
}

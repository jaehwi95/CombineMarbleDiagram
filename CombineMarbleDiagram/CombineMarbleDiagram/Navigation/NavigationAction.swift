//
//  NavigationAction.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI

/// 네비게이션과 관련된 Action을 저장
/// Closure를 Action으로 Wrapping하여 Value type인 struct를 Environment에 저장
struct NavigationAction {
    typealias Action = (NavigationType) -> ()
    
    let action: Action
    
    /// invoked automatically when create an instance of NavigationAction
    func callAsFunction(_ navigationType: NavigationType) {
        action(navigationType)
    }
}

enum NavigationType: Hashable {
    case push(NavigationDestination)
    case pop
    case popToRoot
}

struct NavigationEnvironmentKey: EnvironmentKey {
    static var defaultValue: NavigationAction = NavigationAction(action: { _ in })
}

extension EnvironmentValues {
    var navigate: (NavigationAction) {
        get { self[NavigationEnvironmentKey.self] }
        set { self[NavigationEnvironmentKey.self] = newValue }
    }
}

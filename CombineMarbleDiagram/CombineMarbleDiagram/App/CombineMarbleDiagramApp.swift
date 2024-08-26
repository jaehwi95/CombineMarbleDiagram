//
//  CombineMarbleDiagramApp.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI

@main
struct CombineMarbleDiagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var destinations: [NavigationDestination] = []
    @StateObject var container: DIContainer = DIContainer(services: Services())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $destinations) {
                MainView(viewModel: MainViewModel(container: container))
                    .environmentObject(container)
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .detail(let operatorItem):
                            DetailView(viewModel: DetailViewModel(operatorItem: operatorItem))
                        }
                    }
            }
            .onNavigate { navigationType in
                switch navigationType {
                case let .push(destination):
                    destinations.append(destination)
                case .pop:
                    _ = destinations.popLast()
                case .popToRoot:
                    destinations = []
                }
            }
            .safeAreaBottomPadding()
        }
    }
}

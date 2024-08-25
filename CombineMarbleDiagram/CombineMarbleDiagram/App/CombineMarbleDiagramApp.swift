//
//  CombineMarbleDiagramApp.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct CombineMarbleDiagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var destinations: [NavigationDestination] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $destinations) {
                MainView(viewModel: .init())
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .detail:
                            DetailView(viewModel: DetailViewModel())
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

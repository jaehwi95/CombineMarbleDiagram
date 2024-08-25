//
//  MainViewModel.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

final class MainViewModel: ObservableObject {
    enum Action {
        case loadData
        case loading(Bool)
        case getDataSuccess
        case getDataFailure(Error)
    }
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var operators: [Operator] = []
    private var loadDataTask: Task<Void, Never>?
    
    func send(_ action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .loading(let isLoading):
            Task {
                await toggleLoading(isLoading)
            }
        case .getDataSuccess:
            return
        case .getDataFailure(_):
            return
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension MainViewModel {
    private func loadData() {
        loadDataTask = Task {
            defer {
                send(.loading(false))
            }
            do {
                send(.loading(true))
                let _ = try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
                send(.getDataSuccess)
            } catch {
                send(.getDataFailure(error))
            }
        }
    }
    
    private func populateOperators() async {
        
    }
    
    @MainActor
    private func toggleLoading(_ isLoading: Bool) async {
        self.isLoading = isLoading
    }
    
    @MainActor
    private func getDataFailure(_ error: Error) {
        self.errorMessage = "Error: \(error.localizedDescription)"
    }
}

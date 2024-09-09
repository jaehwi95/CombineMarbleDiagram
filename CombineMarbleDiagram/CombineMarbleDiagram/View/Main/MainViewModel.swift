//
//  MainViewModel.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    enum Action {
        case loadData
        case loading(Bool)
        case addEmptyOperator
        case showError(Error)
    }
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var operators: [Operator] = []
    
    private var container: DIContainer
    private var loadDataTask: Task<Void, Never>?
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(_ action: Action) {
        switch action {
        case .loadData:
            loadData()
        case .loading(let isLoading):
            Task {
                await toggleLoading(isLoading)
            }
        case .addEmptyOperator:
            addEmptyOperator()
        case .showError(let error):
            print("Error: \(error.localizedDescription)")
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
            send(.loading(true))
            let result = await container.services.operatorService.getAllOperators()
            switch result {
            case let .success(operators):
                self.operators = operators
                sortOperators()
            case let .failure(error):
                send(.showError(error))
            }
        }
    }
    
    private func addEmptyOperator() {
        loadDataTask = Task {
            defer {
                send(.loading(false))
            }
            send(.loading(true))
            let result = await container.services.operatorService.addEmptyOperator()
            switch result {
            case .success:
                print("Empty Operator Added")
            case let .failure(error):
                send(.showError(error))
            }
        }
    }
    
    private func toggleLoading(_ isLoading: Bool) async {
        self.isLoading = isLoading
    }
    
    private func getDataFailure(_ error: Error) {
        self.errorMessage = "Error: \(error.localizedDescription)"
    }
    
    private func sortOperators() {
        let sortedOperators = operators.sorted {
            $0.title < $1.title
        }
        operators = sortedOperators
    }
}

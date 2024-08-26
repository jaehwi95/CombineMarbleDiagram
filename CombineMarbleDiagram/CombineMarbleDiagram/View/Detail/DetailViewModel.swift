//
//  DetailViewModel.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    enum Action {
        
    }
    
    let operatorItem: Operator
    
    init(operatorItem: Operator) {
        self.operatorItem = operatorItem
    }
    
    func send(_ action: Action) {
        switch action {
            
        }
    }
}

extension DetailViewModel {
    
}

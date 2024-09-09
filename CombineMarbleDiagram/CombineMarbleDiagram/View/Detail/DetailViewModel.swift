//
//  DetailViewModel.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    enum Action {
        case validateInput(newInputString: String)
    }
    
    @Published var multiplier: String = "3"
    @Published var isValid: Bool = true
    let operatorItem: Operator
    @Published var nodes: [SliderNodeModel] = [
        SliderNodeModel(
            color: .marbleRed,
            text: "1",
            positionScale: 0.3),
        SliderNodeModel(
            color: .marbleYellow,
            text: "2",
            positionScale: 0.4),
        SliderNodeModel(
            color: .marbleBlue,
            text: "3",
            positionScale: 0.8)
    ]
    
    var mappedNodes: [SliderNodeModel] {
        get {
            nodes.map { node in
                SliderNodeModel(
                    color: node.color,
                    text: getMappedResult(inputString: node.text, multiplier: multiplier),
                    positionScale: node.positionScale)
            }
        }
        set {
            
        }
    }
    
    init(operatorItem: Operator) {
        self.operatorItem = operatorItem
    }
    
    func send(_ action: Action) {
        switch action {
        case .validateInput(let newInputString):
            validateInput(newInputString: newInputString)
        }
    }
}

extension DetailViewModel {
    func validateInput(newInputString: String) {
        /// Force only one character - if more, use only prefix
        if newInputString.count > 1 {
            multiplier = String(newInputString.prefix(1))
        } else {
            multiplier = newInputString
        }
        
        /// Allow only 0 ~ 9 int values
        if let intValue = Int(newInputString), (0...9).contains(intValue) {
            isValid = true
        } else {
            isValid = false
        }
    }
    
    private func getMappedResult(inputString: String, multiplier: String) -> String {
        if let intMultiplier = Int(multiplier) {
            let intValue: Int = Int(inputString) ?? 0
            let resultValue: Int = intValue * intMultiplier
            let resultString: String = String(resultValue)
            return resultString
        } else {
            return inputString
        }
    }
}

//
//  OperatorObject.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/26/24.
//

import Foundation

struct OperatorObject: Codable, DictionaryCodable {
    let id: String
    let title: String
    let name: String
    let operatorType: String
}

extension OperatorObject {
    func toModel() -> Operator {
        return Operator(
            id: id,
            title: title,
            name: name,
            type: OperatorType(rawValue: operatorType) ?? .other
        )
    }
}

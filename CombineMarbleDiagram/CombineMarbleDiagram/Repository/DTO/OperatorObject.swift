//
//  OperatorObject.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/26/24.
//

import Foundation

struct OperatorObject: Codable {
    var id: String
    var name: String
    var type: String
}

extension OperatorObject {
    func toModel() -> Operator {
        let operatorType: OperatorType = {
            switch self.type {
            case OperatorTypeValue.Mapping:
                return .mapping
            case OperatorTypeValue.Filtering:
                return .filtering
            default:
                return .mapping
            }
        }()
        
        return .init(
            id: id,
            name: name,
            type: operatorType
        )
    }
}

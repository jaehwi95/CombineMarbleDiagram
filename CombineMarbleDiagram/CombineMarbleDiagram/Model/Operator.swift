//
//  Operator.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

enum OperatorType {
    case mapping
    case filtering
}

struct Operator: Hashable {
    var id: String
    var name: String
    var type: OperatorType
}

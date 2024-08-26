//
//  Operator.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/24/24.
//

import Foundation

enum OperatorType: String {
    case mapping, filtering, other
}

struct Operator: Hashable {
    var id: String
    var title: String
    var name: String
    var type: OperatorType
}

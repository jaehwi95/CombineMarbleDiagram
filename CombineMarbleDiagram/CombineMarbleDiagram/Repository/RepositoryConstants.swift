//
//  RepositoryConstants.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/26/24.
//

import Foundation

typealias DBKey = RepositoryConstants.DBKey
typealias OperatorTypeValue = RepositoryConstants.OperatorTypeValue

enum RepositoryConstants {}

extension RepositoryConstants {
    struct DBKey {
        static let Operators = "Operators"
    }
    
    struct OperatorTypeValue {
        static let Mapping = "Mapping"
        static let Filtering = "Filtering"
    }
}

//
//  DBError.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import Foundation

enum DBError: Error {
    case autoIdFailure
    case parsingFailure
    case error(Error)
}

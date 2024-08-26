//
//  ServiceError.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import Foundation

enum ServiceError: Error {
    case error(Error)
    case dbError(DBError)
}

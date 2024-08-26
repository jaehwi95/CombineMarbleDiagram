//
//  Services.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import Foundation

protocol ServiceType {
    var operatorService: OperatorServiceType { get set }
}

class Services: ServiceType {
    var operatorService: OperatorServiceType
    
    init() {
        self.operatorService = OperatorService(dbRepository: OperatorDBRepository())
    }
}

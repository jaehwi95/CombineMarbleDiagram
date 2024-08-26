//
//  OperatorService.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import Foundation

protocol OperatorServiceType {
    func addEmptyOperator() async -> Result<Void, ServiceError>
    func getAllOperators() async -> Result<[Operator], ServiceError>
}

class OperatorService: OperatorServiceType {
    private var dbRepository: OperatorDBRepository
    
    init(dbRepository: OperatorDBRepository) {
        self.dbRepository = dbRepository
    }
    
    func addEmptyOperator() async -> Result<Void, ServiceError> {
        do {
            try await dbRepository.addEmptyOperator()
            return .success(())
        } catch {
            return .failure(handleError(error))
        }
    }
    
    func getAllOperators() async -> Result<[Operator], ServiceError> {
        do {
            let operatorObjects: [OperatorObject] = try await dbRepository.getAllOperators()
            let operators = operatorObjects.map { operatorObject in
                operatorObject.toModel()
            }
            return .success(operators)
        } catch {
            return .failure(handleError(error))
        }
    }
}

extension OperatorService {
    private func handleError(_ error: Error) -> ServiceError {
        if let dbError = error as? DBError {
            return ServiceError.dbError(dbError)
        } else {
            return ServiceError.error(error)
        }
    }
}

//
//  OperatorDBRepository.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/26/24.
//

import Foundation
import FirebaseDatabase

protocol OperatorDBRepositoryType {
    func addEmptyOperator() async throws
    func getAllOperators() async throws -> [OperatorObject]
}

class OperatorDBRepository: OperatorDBRepositoryType {
    var db: DatabaseReference = Database.database().reference()
    
    func addEmptyOperator() async throws {
        guard let autoId: String = self.db.child(DBKey.Operators).childByAutoId().key else {
            throw DBError.autoIdFailure
        }
        
        let emptyOperator: OperatorObject = OperatorObject(
            id: autoId,
            title: "",
            name: "",
            operatorType: ""
        )
        
        guard let emptyOperatorDictionary: [String: Any] = try? emptyOperator.encode() as? [String: Any] else {
            throw DBError.parsingFailure
        }
        
        try await self.db.child(DBKey.Operators).child(autoId).setValue(emptyOperatorDictionary)
    }
    
    func getAllOperators() async throws -> [OperatorObject] {
        let snapshot = try await self.db.child(DBKey.Operators).getData()
        
        guard let snapshotValue: [String: Any] = snapshot.value as? [String: Any] else {
            /// No Existing Operators
            return []
        }
        
        var operators: [OperatorObject] = []
        for value in snapshotValue.values {
            guard let operatorObject: OperatorObject = try? OperatorObject.decode(value) else {
                throw DBError.parsingFailure
            }
            operators.append(operatorObject)
        }
        return operators
    }
}

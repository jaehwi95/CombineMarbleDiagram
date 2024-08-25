//
//  OperatorRepository.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 8/26/24.
//

import Foundation
import FirebaseDatabase

protocol OperatorRepositoryType {
    func getAllOperators() -> [OperatorObject]
}

class OperatorRepository: OperatorRepositoryType {
    var db: DatabaseReference = Database.database().reference()
    
    func getAllOperators() -> [OperatorObject] {
        let _ = try await self.db.child(OperatorTypeValue)
    }
}

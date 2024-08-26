//
//  DictionaryCodable.swift
//  CombineMarbleDiagram
//
//  Created by Jaehwi Kim on 2024/08/26.
//

import Foundation

protocol DictionaryEncodable {
    func encode() throws -> Any
}

extension DictionaryEncodable where Self: Encodable {
    func encode() throws -> Any {
        let jsonData = try JSONEncoder().encode(self)
        return try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed)
    }
}

protocol DictionaryDecodable {
    static func decode<T: Decodable>(_ dictionary: Any) throws -> T
}

extension DictionaryDecodable {
    static func decode<T: Decodable>(_ dictionary: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
}

typealias DictionaryCodable = DictionaryEncodable & DictionaryDecodable

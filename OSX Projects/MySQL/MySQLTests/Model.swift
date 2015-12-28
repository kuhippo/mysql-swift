//
//  Model.swift
//  MySQL
//
//  Created by ito on 12/20/15.
//  Copyright © 2015 Yusuke Ito. All rights reserved.
//

import MySQL

struct Row {
    
    struct UserDecodeWithIndex: QueryRowResultType, QueryParameterDictionaryType {
        let id: Int
        
        let name: String
        let age: Int
        let createdAt: SQLDate
        
        let nameOptional: String?
        let ageOptional: Int?
        let createdAtOptional: SQLDate?
        
        let done: Bool
        let doneOptional: Bool?
        
        static func decodeRow(r: QueryRowResult) throws -> UserDecodeWithIndex {
            return try build(UserDecodeWithIndex.init)(
                r <| 0,
                
                r <| 1,
                r <| 2,
                r <| 3,
                
                r <|? 4,
                r <|? 5,
                r <|? 6,
                
                r <| 7,
                r <|? 8
            )
        }
        
        func queryParameter() throws -> QueryDictionary {
            return QueryDictionary([
                //"id": // auto increment
                "name": name,
                "age": age,
                "created_at": createdAt,
                
                "name_Optional": nameOptional,
                "age_Optional": ageOptional,
                "created_at_Optional": createdAtOptional,
                
                "done": done,
                "done_Optional": doneOptional
                ])
        }
    }
    
    struct UserDecodeWithKey: QueryRowResultType {
        let id: Int
        
        let name: String
        let age: Int
        let createdAt: SQLDate
        
        let nameOptional: String?
        let ageOptional: Int?
        let createdAtOptional: SQLDate?
        
        let done: Bool
        let doneOptional: Bool?
        
        static func decodeRow(r: QueryRowResult) throws -> UserDecodeWithKey {
            return try build(UserDecodeWithKey.init)(
                r <| "id",
                
                r <| "name",
                r <| "age",
                r <| "created_at",
                
                r <|? "name_Optional",
                r <|? "age_Optional",
                r <|? "created_at_Optional",
                
                r <| "done",
                r <|? "done_Optional"
            )
        }
    }
}
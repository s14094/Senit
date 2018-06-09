//
//  AccountModel.swift
//  Senit
//
//  Created by mac on 09/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//


import UIKit
import ObjectMapper

class AccountModel: Mappable{
    
    var id: Int!
    var firstName: String?
    var lastName: String?
    var login: String!
    var email: String?
    var password: String!
    var createdAt: String?
    var passwordSalt: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        login <- map["login"]
        email <- map["email"]
        password <- map["password"]
        createdAt <- map["createdAt"]
        passwordSalt <- map["passwordsalt"]
    }
}

/*
import UIKit
import Foundation
import Mapper

class AccountModel: Mappable{
    
    let id: Int
    let firstName: String?
    let lastName: String?
    let login: String
    let email: String?
    let password: String
    
    required init(map: Mapper) throws {
        try id = map.from("id")
        firstName = map.optionalFrom("firstName")
        lastName = map.optionalFrom("lastName")
        try login = map.from("login")
        email = map.optionalFrom("email")
        try password = map.from("password")
    }
}
 */

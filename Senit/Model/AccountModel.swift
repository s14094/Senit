//
//  AccountModel.swift
//  Senit
//
//  Created by mac on 09/06/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

struct AccountModel: Decodable{
    let id: Int!
    let firstName: String
    let lastName: String
    let login: String!
    let email: String
    let password: String!
    
    private enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, login, email, password
    }
}

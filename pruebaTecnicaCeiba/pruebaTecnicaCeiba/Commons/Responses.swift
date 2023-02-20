//
//  Responses.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import Foundation

struct UserData: Codable {
    var id: Int
    var name: String
    var username: String?
    var phone: String
    var email: String
    var website: String?
   // var company: [CompanyData]
}


struct PostsData: Codable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct CompanyData: Codable{
    var name: String?
    var catchPhrase: String?
    var bs: String?
}


struct ErrorResponse: Codable {
    let error: String
}

struct ErrorResponseDetail: Codable {
    let detail: String
}

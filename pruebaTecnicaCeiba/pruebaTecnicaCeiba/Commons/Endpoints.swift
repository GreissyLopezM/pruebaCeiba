//
//  Endpoints.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import Foundation

struct Endpoints {
    static let domain = "https://jsonplaceholder.typicode.com"
    static let getUser = Endpoints.domain + "/users"
    static let getPost = Endpoints.domain + "/post"
    static let getPostUser = Endpoints.domain + "/posts?userId="
}

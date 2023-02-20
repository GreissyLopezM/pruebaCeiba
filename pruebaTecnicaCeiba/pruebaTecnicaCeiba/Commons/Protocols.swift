//
//  Protocols.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import Foundation
import NotificationBannerSwift
import Simple_Networking

protocol UsersProtocols {
    func getUsers(completion: @escaping (_ result: ([UserData],String?)) -> Void)
}

class UsersModel:UsersProtocols{
    
    func getUsers(completion: @escaping (([UserData], String?)) -> Void) {
        SN.get(endpoint: Endpoints.getUser) { ( response: SNResultWithEntity<[UserData], ErrorResponse>) in
            
            switch response {
            case .success(let users):
                completion((users,nil))
                
            case .error(let error):
                NotificationBanner(title: "Error al obtener data",
                                   subtitle: error.localizedDescription,
                                   style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "No conection",
                                   subtitle: entity.error,
                                   style: .warning).show()
            }
        }
    }
}

protocol PostsProtocols {
    func getPostUser(userId: Int,completion: @escaping (_ result: ([PostsData],String?)) -> Void)
}

class PostsModel:PostsProtocols{
    
    func getPostUser(userId: Int, completion: @escaping (([PostsData], String?)) -> Void) {
        
        SN.get(endpoint: "\(Endpoints.getPostUser)\(userId)") { ( response: SNResultWithEntity<[PostsData], ErrorResponse>) in
            
            switch response {
            case .success(let posts):
                completion((posts,nil))
                
            case .error(let error):
                NotificationBanner(title: "Error al obtener data",
                                   subtitle: error.localizedDescription,
                                   style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "No conection",
                                   subtitle: entity.error,
                                   style: .warning).show()
            }
        }
    }
}



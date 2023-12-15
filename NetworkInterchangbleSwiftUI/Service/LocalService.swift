//
//  LocalService.swift
//  NetworkInterchangbleSwiftUI
//
//  Created by Vedat Dokuzkardeş on 8.12.2023.
//

import Foundation

class LocalService : NetworkService{
    
    var type: String = "Localservice"
    

    func download(_ resource: String) async throws -> [User] {

        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            fatalError("Resource nod found!")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}

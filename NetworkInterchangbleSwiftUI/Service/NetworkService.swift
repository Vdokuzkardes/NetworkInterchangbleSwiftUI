//
//  NetworkService.swift
//  NetworkInterchangbleSwiftUI
//
//  Created by Vedat Dokuzkardeş on 8.12.2023.
//

import Foundation

protocol NetworkService{
    
    func download(_ resource: String) async throws -> [User]
    var type : String {get}
}

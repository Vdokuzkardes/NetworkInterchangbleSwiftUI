//
//  ContentView.swift
//  NetworkInterchangbleSwiftUI
//
//  Created by Vedat Dokuzkardeş on 7.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init(){
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    var body: some View {

        List(userListViewModel.userList, id: \.id) { user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.brown)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}

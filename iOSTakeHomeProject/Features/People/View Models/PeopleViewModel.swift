//
//  PeopleViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 9/9/22.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    
    @Published private(set) var users: [User] = []
    
    func fetchUsers() {
     
        NetworkingManager.shared.request("https://reqres.in/api/users", type: UsersResponse.self) { [weak self] res in
            
            switch res {
                
            case .success(let response):
                self?.users = response.data
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

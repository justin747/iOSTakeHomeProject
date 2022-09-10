//
//  DetailsViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 9/9/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published private(set) var userInfo: UserDetailResponse?
    
    func fetchDetail(for id: Int) {
        
        NetworkingManager.shared.request("https://reqres.in/api/users/\(id)", type: UserDetailResponse.self) { [weak self] res in
            
            DispatchQueue.main.async {
                
                switch res {
                    
                case .success(let response):
                    self?.userInfo = response
                    
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}

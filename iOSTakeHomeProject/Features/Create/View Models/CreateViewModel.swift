//
//  CreateViewModel.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 9/10/22.
//

import Foundation

final class CreateViewModel: ObservableObject {
    
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    
    func create() {
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(person)
        
        NetworkingManager.shared.request(methodType: .POST(data: data), "https://reqres.in/api/users") { [weak self] res in
            
            DispatchQueue.main.async {
                
                switch res {
                    
                case .success:
                    self?.state = .successful
                    
                case .failure(let err):
                    self?.state = .unsuccessful
                }
            }
        }
    }
}

extension CreateViewModel {
    
    enum SubmissionState{
        
        case unsuccessful
        case successful
    }
}

//
//  CreateView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/29/22.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                firstName
                lastName
                job
                
                Section{
                    submit
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    doneButton
                
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

private extension CreateView {
    
    var doneButton: some View {
        Button("Done") {
            //Button Action
            dismiss()
        }
    }
    
    var firstName: some View {
        TextField("First Name", text: .constant("First"))
    }
    
    var lastName: some View {
        TextField("Last Name", text: .constant(""))
    }
    
    var job: some View {
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View {
        Button("Submit") {
            //Button Action
        }
    }
}


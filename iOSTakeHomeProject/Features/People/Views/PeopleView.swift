//
//  PeopleView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/21/22.
//

import SwiftUI

struct PeopleView: View {
    
    @State private var showCreate = false
    @StateObject private var vm = PeopleViewModel()
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                
                background
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(vm.users, id: \.id) { user in
                            NavigationLink {
                                DetailView()
                            } label: {
                                PersonItemView(user: user)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    create
                    
                }
            }
            .onAppear {
                vm.fetchUsers()
            }
            .sheet(isPresented: $showCreate) {
                CreateView()
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}

private extension PeopleView {
    
    var background: some View {
        Theme.background
            .edgesIgnoringSafeArea(.top)
    }
    
    var create: some View {
        
        Button {
            showCreate.toggle()
        } label: {
            Symbols.plus
                .font(
                    .system(.headline, design: .rounded)
                    .bold())
        }
        
    }
    
}

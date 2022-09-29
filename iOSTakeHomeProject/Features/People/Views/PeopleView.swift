//
//  PeopleView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/21/22.
//

import SwiftUI

struct PeopleView: View {
    
    @State private var showCreate  = false
    @State private var showSuccess = false
    @State private var hasAppeared = false
    @StateObject private var vm    = PeopleViewModel()
    
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                
                background
                
                if vm.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(vm.users, id: \.id) { user in
                                NavigationLink {
                                    DetailView(userID: user.id)
                                } label: {
                                    PersonItemView(user: user)
                                        .task {
                                            if vm.hasReachedEnd(of: user) && !vm.isFetching {
                                                await vm.fetchNextSetOfUsers()
                                            }
                                        }
                                }
                            }
                        }
                        .padding()
                    }
                    .overlay(alignment: .bottom) {
                        if vm.isFetching {
                            ProgressView()
                        }
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    create
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    refresh
                    
                }
            }
            .task {
                if !hasAppeared {
                    await vm.fetchUsers()
                    hasAppeared = true
                }
            }
            .sheet(isPresented: $showCreate) {
                CreateView {
                    haptic(.success)
                    withAnimation(.spring().delay(0.25)) {
                        self.showSuccess.toggle()
                    }
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button("Retry") {
                    Task {
                        await vm.fetchUsers()
                    }
                }
            }
            .overlay {
                if showSuccess {
                    CheckmarkPopoverView()
                        .transition(.scale.combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.spring()) {
                                    self.showSuccess.toggle()
                                }
                            }
                        }
                }
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
        .disabled(vm.isLoading)
    }
    
    var refresh: some View {
        
        Button {
            Task {
                await vm.fetchUsers()
            }
        } label: {
            Symbols.refresh
        }
        .disabled(vm.isLoading)
    }
}

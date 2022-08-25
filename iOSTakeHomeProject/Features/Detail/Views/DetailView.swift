//
//  DetailView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/24/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            
            background
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 18) {
                    
                }
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}


private extension DetailView {
    
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
}

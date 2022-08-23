//
//  PersonItemView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/22/22.
//

import SwiftUI

struct PersonItemView: View {
    
    let user: Int
    
    var body: some View {
        VStack(spacing: .zero) {
            Rectangle()
                .fill(.black)
                .frame(height: 130)
            
            VStack(alignment: .leading) {
                
                PillView(id: user)
                
                Text("First Name - Last Name")
                    .foregroundColor(Theme.text)
                    .font(.system(.body, design: .rounded))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Theme.background)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct PersonItemView_Previews: PreviewProvider {
    static var previews: some View {
        PersonItemView(user: 0)
            .frame(width: 250)
    }
}

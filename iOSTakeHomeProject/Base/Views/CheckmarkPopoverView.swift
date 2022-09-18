//
//  CheckmarkPopoverView.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 9/13/22.
//

import SwiftUI

struct CheckmarkPopoverView: View {
    var body: some View {
        Symbol.checkmark
            .font(.system(.largeTitle, design: .rounded).bold())
    }
}

struct CheckmarkPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkPopoverView()
    }
}

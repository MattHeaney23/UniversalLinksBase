//
//  UserView.swift
//  UniversalLinkDemo
//
//  Created by Matt on 03/05/2024.
//

import SwiftUI

struct UserView: View {
    
    let userID: String

    var body: some View {
        Text("Hello user: \(userID)")
    }
}

#Preview {
    UserView(userID: "User001")
}

//
//  UniversalLinkDemoApp.swift
//  UniversalLinkDemo
//
//  Created by Matt on 03/05/2024.
//

import SwiftUI

@main
struct UniversalLinkDemoApp: App {
    // Define the path state variable with initial string values
    @State private var path: [String] = ["User001", "User002"]
    
    var body: some Scene {
        WindowGroup {
            // Create a NavigationStack using the path state
            NavigationStack(path: $path) {
                HomeView()
                    .navigationDestination(for: String.self) { value in
                        UserView(userID: value)
                    }
                    .onOpenURL { url in
                        if let userIDFromUniversalLink = UniversalLinkHandler.handleUniversalLink(url: url) {
                            path.append(userIDFromUniversalLink)
                        }
                    }
            }
        }
    }
}

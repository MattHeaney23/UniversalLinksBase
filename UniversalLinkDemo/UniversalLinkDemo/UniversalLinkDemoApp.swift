//
//  UniversalLinkDemoApp.swift
//  UniversalLinkDemo
//
//  Created by Matt on 03/05/2024.
//

import SwiftUI

@main
struct UniversalLinkDemoApp: App {

    @State private var path: [String] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                HomeView()
                    .navigationDestination(for: String.self) { value in
                        UserView(userID: value)
                    }
                    .onOpenURL { url in
                        // When it opens the app is opened by URL, we grab the url, hand it over to the
                        
                        // Note - for the app to be launched by universal link, it needs a few extra steps:
                            // You need to upload the apple-app-site-association to your server/ you web domain
                            // You need to add the URL in the associated domains in your app capabilities. This uses the format: applinks:domain. In this project, I've used applinks:exampleapp.com
                        
                        if let userIDFromUniversalLink = UniversalLinkHandler.handleUniversalLink(url: url) {
                            path.append(userIDFromUniversalLink)
                        }
                    }
            }
        }
    }
}

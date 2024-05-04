//
//  UniversalLinkHandler.swift
//  UniversalLinkDemo
//
//  Created by Matt on 03/05/2024.
//

import Foundation

class UniversalLinkHandler {
    
    //I've tucked this logic away in a handler, just to keep it as separate as possible to make it as generic as possible.
    // This will take a url with a userID and will return this string to be added to the navigation stack. This is used over in the UniversalLinkDemoApp in the openURL.
    
    static func handleUniversalLink(url: URL) -> String? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems,
              let userIDItem = queryItems.first(where: { $0.name == "userID" }),
              let userID = userIDItem.value else {
            print("No user id found")
            return nil
        }
        
        return userID
    }
}

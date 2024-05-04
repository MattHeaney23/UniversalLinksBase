//
//  UniversalLinkHandler.swift
//  UniversalLinkDemo
//
//  Created by Matt on 03/05/2024.
//

import Foundation

class UniversalLinkHandler {
    
    static func handleUniversalLink(url: URL) -> String? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            print("No query items in URL")
            return nil
        }
        
        // Look for the userID query parameter
        if let userIDItem = queryItems.first(where: { $0.name == "userID" }),
           let userID = userIDItem.value {
            return userID
        } else {
            return nil
        }
    }
}

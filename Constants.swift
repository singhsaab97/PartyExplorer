//
//  Constants.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

struct Constants {
    
    // Text
    static let navigationTitle = "Party Explorer"
    
    // Image
    static let addImageName = "plus"
    
    // Data
    static let numberOfDefaultParties: Int = 3
    static let partyNames = [
        "Groove Gala",
        "Fiesta Frenzy",
        "Neon Nightlife",
        "Disco Delight",
        "Rhythm Rapture",
        "Carnival Cascade",
        "Sparkle Spectacle",
        "Jamboree Jive"
    ]
    static let bannerUrlPaths = [
        ""
    ]
    static let priceRange: ClosedRange<Double> = 100.0...1000.0
    static let startTimeRange: ClosedRange<Double> = 3600...86400
    static let endTimeRange: ClosedRange<Double> = 3600...172800
    
}

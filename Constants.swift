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
    static let price = "Price"
    static let duration = "Duration"
    static let startDate = "Start Date"
    
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
        "https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg",
        "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg",
        "https://images.pexels.com/photos/801863/pexels-photo-801863.jpeg",
        "https://images.pexels.com/photos/3171837/pexels-photo-3171837.jpeg"
    ]
    static let priceRange: ClosedRange<Double> = 100.0...1000.0
    static let startTimeRange: ClosedRange<Double> = 3600...86400
    static let endTimeRange: ClosedRange<Double> = 3600...172800
    
}

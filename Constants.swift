//
//  Constants.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

struct Constants {
    
    // Text
    static let partyExplorer = "Party Explorer"
    static let scheduleParty = "Schedule Party"
    static let price = "Price"
    static let duration = "Duration"
    static let startDate = "Start Date"
    static let endDate = "End Date (Optional)"
    static let cancel = "Cancel"
    static let done = "Done"
    static let error = "Error"
    static let priceEmptyMessage = "Enter a price for the party."
    static let yay = "Yay!"
    static let newPartyMessage = "You've scheduled a new party."
    static let ok = "Okay"
    static let great = "Great"
    
    // Image
    static let addImageName = "plus"
    
    // Data
    static let numberOfDefaultParties: Int = 3
    static let partyNames = [
        "Groove Gala",
        "Celestial Soiree",
        "Fiesta Fantastica",
        "Epic Euphoria",
        "Starry Night Shindig",
        "Neon Nirvana",
        "Dazzle Daze",
        "Vivid Vogue",
        "Retro Rendezvous",
        "Electric Elegance",
        "Moonlight Mirage",
        "Funky Fusion Fiesta",
        "Sizzle & Swing Soiree",
        "Midnight Marvel",
        "Glamour Glitz Gala",
        "Safari Soiree",
        "Whimsical Wonderland",
        "Mystic Masquerade",
        "Lunar Luminescence",
        "Carnival Carousel"
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

//
//  PartyModel.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

/// A struct representing a party with identifiable and equatable properties
struct Party: Identifiable, Equatable {
    let id = UUID()                   // Unique identifier for each party
    let name: String                  // Name of the party
    let bannerUrl: URL                // URL for the party's banner image
    let price: Double                 // Price of the party
    let startDate: Date               // Start date of the party
    let endDate: Date?                // Optional end date of the party
        
    // Generates an array of random parties based on predefined constants
    static var randomParties: [Party] {
        return (1...Constants.numberOfDefaultParties).compactMap { _ in
            guard let name = Constants.partyNames.randomElement(),
                  let bannerUrlPath = Constants.bannerUrlPaths.randomElement(),
                  let bannerUrl = URL(string: bannerUrlPath) else { return nil }
            let price = Double.random(in: Constants.priceRange)
            let startDate = Date().addingTimeInterval(Double.random(in: Constants.startTimeRange))
            let endDate = Bool.random() ? nil : startDate.addingTimeInterval(Double.random(in: Constants.endTimeRange))
            return Party(
                name: name,
                bannerUrl: bannerUrl,
                price: price,
                startDate: startDate,
                endDate: endDate
            )
        }
    }
    
    // Creates a party with specified parameters, returns nil if any parameter is invalid
    // which won't be the case because of hardcoded values
    static func create(with price: Double, startDate: Date, endDate: Date?) -> Party? {
        guard let name = Constants.partyNames.randomElement(),
              let bannerUrlPath = Constants.bannerUrlPaths.randomElement(),
              let bannerUrl = URL(string: bannerUrlPath) else { return nil }
        return Party(
            name: name,
            bannerUrl: bannerUrl,
            price: price,
            startDate: startDate,
            endDate: endDate
        )
    }
    
}

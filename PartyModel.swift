//
//  PartyModel.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

struct Party: Identifiable {
    let id = UUID()
    let name: String
    let bannerUrl: URL
    let price: Double
    let startDate: Date
    let endDate: Date?
}

// MARK: - Exposed Helpers
extension Party {
    
    static var randomParties: [Party] {
        return (1...Constants.numberOfDefaultParties).compactMap {_ in
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
    
}

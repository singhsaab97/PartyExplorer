//
//  PartyCardView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

// A SwiftUI view that displays details of a party
struct PartyCardView: View {
    
    let party: Party  // The party object to display details for
    
    // DateFormatter for formatting dates in a medium style
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    // NumberFormatter for formatting the party price
    private let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 15) {
            // AsyncImage to display the party's banner with placeholder and loading views
            AsyncImage(url: party.bannerUrl) { phase in
                switch phase {
                case let .success(image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(16)
                case .failure:
                    Color.clear
                default:
                    ProgressView()
                }
            }
            // VStack to display party details: name, price, and date/duration
            VStack(spacing: 6) {
                Text(party.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.primary)
                Text("\(Constants.price): $\(priceFormatter.string(from: party.price as NSNumber) ?? String(format: "%.2f", party.price))")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary)
                // Display date range or start date based on the presence of an end date
                if let endDate = party.endDate {
                    Text("\(Constants.duration): \(formattedDateRange(party.startDate, endDate))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.secondary)
                } else {
                    Text("\(Constants.startDate): \(dateFormatter.string(from: party.startDate))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
    
}

// MARK: - Private Helpers
private extension PartyCardView {
    
    // Formats the date range string for display.
    func formattedDateRange(_ startDate: Date, _ endDate: Date) -> String {
        return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
    }
    
}


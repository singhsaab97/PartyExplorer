//
//  PartyCard.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

struct PartyCard: View {
        
    let party: Party
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    private let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 15) {
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
            
            VStack(spacing: 6) {
                Text(party.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.primary)
                Text("\(Constants.price): $\(priceFormatter.string(from: party.price as NSNumber) ?? String(format: "%.2f", party.price))")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary)
                
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
private extension PartyCard {
    
    func formattedDateRange(_ startDate: Date, _ endDate: Date) -> String {
        return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
    }
    
}

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
    
    var body: some View {
        VStack(spacing: 20) {
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
                Text("\(Constants.price): $\(String(format: "%.2f", party.price))")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.primary)
                
                if let endDate = party.endDate {
                    Text("\(Constants.duration): \(formattedDateRange(party.startDate, endDate))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.secondary)
                } else {
                    Text("\(Constants.startDate): \(formattedDate(party.startDate))")
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
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    func formattedDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    func formattedDateRange(_ startDate: Date, _ endDate: Date) -> String {
        let formatter = dateFormatter
        return "\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
    }
    
}

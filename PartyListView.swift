//
//  PartyListView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

/// A SwiftUI view that displays a list of parties using PartyCardView
struct PartyListView: View {
    
    // Array of parties to display in the list
    let parties: [Party]
    let searchText: String
    
    var body: some View {
        if parties.isEmpty {
            // Display an empty view UI when search results are empty
            EmptyPartiesView(searchText: searchText)
        } else {
            // Display the list of parties
            List(parties) { party in
                PartyCardView(party: party)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
    
}

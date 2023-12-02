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
    
    var body: some View {
        List(parties) { party in
            // Display each party using PartyCardView as a list row
            PartyCardView(party: party)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
}

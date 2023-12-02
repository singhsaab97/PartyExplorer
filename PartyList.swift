//
//  PartyList.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

struct PartyList: View {
    
    let parties: [Party]
    
    var body: some View {
        List(parties) { party in
            PartyCard(party: party)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
}

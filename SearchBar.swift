//
//  SearchBar.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    
    @State private var searchText = String()

    var body: some View {
        HStack {
            TextField("Search by name", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
    
}

//
//  PartyData.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

/// A class responsible for managing party-related data and notifying observers of changes
final class PartyData: ObservableObject {
    
    // Published property representing an array of Party objects
    @Published var parties: [Party] = Party.randomParties
    
}

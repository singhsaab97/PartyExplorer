//
//  PartyData.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation

final class PartyData: ObservableObject {
    
    @Published var parties: [Party] = Party.randomParties
    
}

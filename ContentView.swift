//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var data = PartyData()
    @State private var searchText = String()
        
    var body: some View {
        NavigationView {
            VStack {
                PartyList(parties: data.parties)
            }
            .navigationBarTitle(Constants.navigationTitle)
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action: addNewParty) {
                Image(systemName: Constants.addImageName)
            })
        }
    }
    
}

// MARK: - Private Helpers
private extension ContentView {
    
    func addNewParty() {
        // TODO
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}

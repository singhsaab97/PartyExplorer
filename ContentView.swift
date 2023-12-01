//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = String()
        
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationBarTitle(Constants.navigationTitle)
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action: addNewParty) {
                Image(systemName: Constants.addImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .padding(10)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
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

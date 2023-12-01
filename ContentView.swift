//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
            }
            .navigationBarTitle("Party Explorer")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import SwiftUI

struct ContentView: View {
        
    // ObservedObject to manage the party data
    @ObservedObject private var data = PartyData()
    
    // State variable to store the search text
    @State private var searchText = String()
    
    // State variables to manage the presentation of the Create Party view and alerts
    @State private var isCreatePartyViewPresented = false
    @State private var newParty: Party?
    @State private var isAlertPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                // ScrollView to display the list of parties
                ScrollViewReader { scrollView in
                    PartyListView(parties: filteredParties)
                        .onChange(of: newParty) { _ in
                            // Scroll to the bottom when a new party is added
                            if newParty == nil,
                               let newParty = data.parties.last {
                                withAnimation {
                                    scrollView.scrollTo(newParty.id, anchor: .bottom)
                                }
                            }
                        }
                }
            }
            // Navigation bar configuration
            .navigationBarTitle(Constants.partyExplorer)
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action: {
                // Toggle the presentation of the Create Party view
                isCreatePartyViewPresented.toggle()
            }) {
                Image(systemName: Constants.addImageName)
            })
            .fullScreenCover(isPresented: $isCreatePartyViewPresented) {
                // Full-screen modal to create a new party
                CreatePartyView(isPresented: $isCreatePartyViewPresented, onDone: { party in
                    // Callback when a new party is added
                    addNewParty(party)
                })
                .onDisappear {
                    // Show an alert when a new party is added
                    isAlertPresented = newParty != nil
                }
            }
        }
        // Alert to notify the user when a new party is added
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(Constants.yay),
                message: Text(Constants.newPartyMessage),
                dismissButton: .default(Text(Constants.great)) {
                    // Reset newParty and alert presentation
                    newParty = nil
                    isAlertPresented = false
                }
            )
        }
    }
    
}

// MARK: - Private Helpers
private extension ContentView {
    
    // Filter parties based on the search text
    var filteredParties: [Party] {
        if searchText.isEmpty {
            return data.parties
        } else {
            return data.parties.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    // Add a new party to the data and trigger the alert
    func addNewParty(_ party: Party) {
        data.parties.append(party)
        newParty = party
    }
    
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}

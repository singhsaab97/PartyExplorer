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
    @State private var isCreatePartyPresented = false
    @State private var newParty: Party?
    @State private var isAlertPresented = false
        
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { scrollView in
                    PartyList(parties: data.parties)
                        .onChange(of: newParty) {_ in
                            if newParty == nil,
                               let newParty = data.parties.last {
                                withAnimation {
                                    scrollView.scrollTo(newParty.id, anchor: .bottom)
                                }
                            }
                        }
                }
            }
            .navigationBarTitle(Constants.partyExplorer)
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action: {
                isCreatePartyPresented.toggle()
            }) {
                Image(systemName: Constants.addImageName)
            })
            .fullScreenCover(isPresented: $isCreatePartyPresented) {
                CreatePartyView(isPresented: $isCreatePartyPresented, onDone: { party in
                    addNewParty(party)
                })
                .onDisappear {
                    isAlertPresented = newParty != nil
                }
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(Constants.yay),
                message: Text(Constants.newPartyMessage),
                dismissButton: .default(Text(Constants.great)) {
                    newParty = nil
                    isAlertPresented = false
                }
            )
        }
    }
    
}

// MARK: - Private Helpers
private extension ContentView {
    
    func addNewParty(_ party: Party) {
        data.parties.append(party)
        newParty = party
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}

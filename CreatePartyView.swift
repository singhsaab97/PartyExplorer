//
//  CreatePartyView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

/// A SwiftUI view for creating a new party, allowing the user to input price, start date, and optionally end date
struct CreatePartyView: View {
    
    // Binding to control the presentation of the view
    @Binding var isPresented: Bool
    
    // State variables to store user input for price, start date, end date, and enable/disable end date
    @State private var price = String()
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var isEndDateEnabled = false
    
    // State variable to track whether the text field is focused
    @FocusState private var isTextFieldFocused: Bool
    
    // State variable to track whether the alert is presented
    @State private var isAlertPresented = false
    
    // Callback closure to be executed when the party is created
    var onDone: ((Party) -> Void)
    
    var body: some View {
        NavigationView {
            Form {
                // Text field for entering the party price
                TextField(Constants.price, text: $price)
                    .font(.system(size: 16))
                    .keyboardType(.decimalPad)
                    .focused($isTextFieldFocused)
                    .onAppear {
                        isTextFieldFocused = true
                    }
                
                // Date picker for selecting the start date
                VStack(alignment: .leading) {
                    Text(Constants.startDate)
                        .font(.system(size: 16))
                    DatePicker(Constants.startDate, selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .onChange(of: startDate) { newStartDate in
                            // Ensure the start date is not earlier than today
                            let today = Calendar.current.startOfDay(for: Date())
                            startDate = max(today, newStartDate)
                            endDate = max(endDate, startDate)
                        }
                }
                
                // Toggle for enabling/disabling the end date
                VStack(alignment: .leading) {
                    Toggle(Constants.endDate, isOn: $isEndDateEnabled)
                        .tint(.blue)
                        .font(.system(size: 16))
                    // Display the end date picker if end date is enabled
                    if isEndDateEnabled {
                        DatePicker(Constants.endDate, selection: $endDate, in: startDate..., displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                    }
                }
            }
            .navigationBarTitle(Constants.scheduleParty)
            .navigationBarItems(
                // Cancel button to dismiss the view
                leading: Button(Constants.cancel) {
                    isPresented = false
                },
                
                // Done button to create the party and execute the callback
                trailing: Button(action: {
                    // Show an alert if the price is empty
                    guard !price.isEmpty else {
                        isAlertPresented = true
                        return
                    }
                    // Create a party and execute the callback
                    let endDate = isEndDateEnabled ? endDate : nil
                    if let priceValue = Double(price),
                       let party = Party.create(with: priceValue, startDate: startDate, endDate: endDate) {
                        onDone(party)
                        isPresented = false
                    }
                }) {
                    Text(Constants.done)
                        .fontWeight(.bold)
                }
            )
        }
        // Alert to notify the user if the price is empty
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(Constants.error),
                message: Text(Constants.priceEmptyMessage),
                dismissButton: .default(Text(Constants.ok))
            )
        }
    }
    
}

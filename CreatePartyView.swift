//
//  CreatePartyView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 01/12/23.
//

import Foundation
import SwiftUI

struct CreatePartyView: View {
    
    @Binding var isPresented: Bool
    @State private var price = String()
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var isEndDateEnabled = false
    @State private var isAlertPresented = false
    @FocusState private var isTextFieldFocused: Bool
    
    var onDone: ((Party) -> Void)

    var body: some View {
        NavigationView {
            Form {
                TextField(Constants.price, text: $price)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
                    .onAppear {
                        isTextFieldFocused = true
                    }
                VStack(alignment: .leading) {
                    Text(Constants.startDate)
                    DatePicker(Constants.startDate, selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .onChange(of: startDate) { newStartDate in
                            let today = Calendar.current.startOfDay(for: Date())
                            startDate = max(today, newStartDate)
                            endDate = max(endDate, startDate)
                        }
                }
                VStack(alignment: .leading) {
                    Toggle(Constants.endDate, isOn: $isEndDateEnabled)
                        .tint(.blue)
                    if isEndDateEnabled {
                        DatePicker(Constants.endDate, selection: $endDate, in: startDate..., displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                    }
                }
            }
            .navigationBarTitle(Constants.scheduleParty)
            .navigationBarItems(
                leading: Button(Constants.cancel) {
                    isPresented = false
                },
                trailing: Button(action: {
                    guard !price.isEmpty else {
                        isAlertPresented = true
                        return
                    }
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
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(Constants.error),
                message: Text(Constants.priceEmptyMessage),
                dismissButton: .default(Text(Constants.ok))
            )
        }
    }
    
}

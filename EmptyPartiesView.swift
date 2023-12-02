//
//  EmptyPartiesView.swift
//  PartyExplorer
//
//  Created by Abhijit Singh on 02/12/23.
//

import Foundation
import SwiftUI

/// An empty SwiftUI view that id shown when no parties matching the search text are found
struct EmptyPartiesView: View {
    
    // The search text used in the message
    let searchText: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: Constants.searchImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 2.5, height: geometry.size.width / 2.5)
                        .foregroundColor(Color(.systemGray2))
                        .padding(.bottom, 20)
                    Spacer()
                }
                // Vertical stack for the title and subtitle
                VStack(spacing: 10) {
                    Text(Constants.emptySearchTitle)
                        .foregroundColor(.primary)
                        .font(.system(size: 20, weight: .bold))
                    Text("\(Constants.emptySearchMessage) \"\(searchText)\"")
                        .foregroundColor(.secondary)
                        .font(.system(size: 16, weight: .semibold))
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
    }
}

//
//  SearchResultsHeader.swift
//  SearchResultsHeader
//
//  Created by Richard Meitzler on 8/21/21.
//

import SwiftUI

struct SearchResultsHeader: View {
  @ObservedObject var viewModel: VXMLViewModel
  //@Binding var searchText: String
  //@Binding var searchResults: [UUID]
  
    var body: some View {
      HStack {
        Text("\(viewModel.searchResultMatches.count) results")
        Spacer()
      }
      .padding(8)
      .frame(maxWidth:.infinity, maxHeight: 40, alignment: .leading)
      .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8.0))
    }
}

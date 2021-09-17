//
//  SearchResultsHeader.swift
//  SearchResultsHeader
//
//  Created by Richard Meitzler on 8/21/21.
//

import SwiftUI
import XMLTree

struct SearchResultsHeader: View {
  @ObservedObject var viewModel: VXMLViewModel
  //@Binding var searchText: String
  //@Binding var searchResults: [UUID]
  @State var searchType: XMLTree.XMLSearchType = .containsTerm
  
    var body: some View {
      HStack {
        Text("\(viewModel.searchResultMatches.count) results")
        Divider()
        SearchHistoryView(viewModel: viewModel)
        Picker("Search Type", selection: $viewModel.searchRequest.searchType) {
          Text("Exact")
            .tag(XMLTree.XMLSearchType.exactMatch)
          Text("Contains")
            .tag(XMLTree.XMLSearchType.containsTerm)
        }
        .pickerStyle(.segmented)
        .frame(width: 200)
      }
      .padding(8)
      .frame(maxWidth:.infinity, maxHeight: 40, alignment: .leading)
      .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8.0))
     // .navigationBarHidden(true)
      .onReceive(viewModel.$searchRequest) { request in
        searchType = request.searchType
      }
      .onChange(of: searchType) { _ in
        print("type changed")
        let term = viewModel.searchRequest.searchText
        viewModel.searchRequest = SearchRequest.empty()
        viewModel.searchRequest  = SearchRequest(searchText: term, searchType: searchType)
        
      }
    }
}

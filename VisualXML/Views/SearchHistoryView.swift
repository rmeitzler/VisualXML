//
//  SearchHistoryView.swift
//  SearchHistoryView
//
//  Created by Richard Meitzler on 8/26/21.
//

import SwiftUI

struct SearchHistoryView: View {
  @ObservedObject var viewModel: VXMLViewModel
  @State var searchHistory: [String] = []
  
    var body: some View {
      
      ScrollView(.horizontal) {
        HStack{
          ForEach(searchHistory.reversed(), id:\.self) { term in
          
          Button(action: { searchFor(term) }) {
            Text("\(term)")
              .padding(4)
              .padding([.leading, .trailing], 4)
              .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
          }
          Spacer()
        }
        }.frame(maxWidth: .infinity, maxHeight: 44)
      }
      .frame(maxWidth: .infinity, maxHeight: 44)
      //.navigationBarHidden(true)
      .onReceive(viewModel.$searchHistory) { history in
        searchHistory = history.unique()
      }
    }
  
  func searchFor(_ term: String) {
    viewModel.searchRequest = SearchRequest(searchText: term)
  }
}

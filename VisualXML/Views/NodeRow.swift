//
//  NodeRow.swift
//  NodeRow
//
//  Created by Richard Meitzler on 8/20/21.
//

import SwiftUI
import XMLTree

struct NodeRow: View {
  @ObservedObject var viewModel: VXMLViewModel
  //@State var isExpanded: Bool = false
  @State var item : XMLTree
  
  @Binding var selectedTree: XMLTree?
//  @Binding var searchResults: [UUID]
//  @Binding var expandedParents: [UUID]
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack(alignment: (item.nameAttribute != nil) ? .top : .center) {
          
          VStack(alignment: .leading) {
            DisplayName()
            
            HStack {
              Text("\(item.name)")
                .foregroundColor(.gray)
              
              if let ct = item.children?.count {
                Text("\(ct) items")
                  .font(.system(size: 12))
                  .foregroundColor(.gray)
              }
            }
          }
          
          DisplayValue()
          
          if item.attributes.count > 0 {
            Button(action: {
              if selectedTree == item {
                selectedTree = nil
              } else {
                selectedTree = item
              }
            }) {
              Image(systemName: "info.circle")
                .padding(8)
            }
          }
          
//          Spacer()
//          Text("\(item.namedBreadcrumbs)")
          

        }
      }
      .padding([.leading, .trailing], 8)
      .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
      .background(backgroundColor(), in: RoundedRectangle(cornerRadius: 4.0))
    }
  
  @ViewBuilder func DisplayName() -> some View {
    if let named = item.nameAttribute {
      let idVal = item.idAttribute
      Text("\(named) \( idVal != nil ? "(\(idVal!))" : item.name == "CustomField" ? ":" : "" )")
    }
  }
  
  @ViewBuilder func DisplayValue() -> some View {
      if let val = item.value {
        
        if item.name == "Id" {
          Button(action:{
            withAnimation() {
              viewModel.searchRequest = SearchRequest(searchText: val, searchType: .exactMatch)
            }
          }) {
            Text("\(val)")
          }
        } else {
          Text("\(val)")
              .foregroundColor(.gray)
        }
        
      } else if item.attributes.keys.contains("Value") {
        if let val = item.attributes["Value"] {
          Text("\(val)")
        }
      } else {
        EmptyView()
      }
  }
    
  func backgroundColor() -> Color {
    if viewModel.searchResultMatches.contains(item.id) {
      return Color.yellow.opacity(0.25)
    }
    return Color.clear
  }
}

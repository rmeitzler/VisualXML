//
//  ContentView.swift
//  VisualXML
//
//  Created by Richard Meitzler on 7/15/21.
//

import SwiftUI
import XMLTree

struct ContentView: View {
  
  @StateObject var xmlManager: XMLManager = XMLManager()
  @StateObject var viewModel: VXMLViewModel = VXMLViewModel()
  
  @State var selectedTree: XMLTree?
  @State var currentModel: [XMLTree] = []
  
    var body: some View {

      NavigationView {
          List {
            if viewModel.searchTerm.count > 0 {
              SearchResultsHeader(viewModel: viewModel)
            }
            
            ForEach(currentModel, id:\.self) { tree in
              NodeDisclosure(viewModel: viewModel, item: tree, selectedTree: $selectedTree)
            }
            
          }.listStyle(.insetGrouped)
          .sheet(item: $selectedTree) { item in
            ViewAttributes(item.attributes).padding()
          }
        .navigationTitle("Firehouse Subs")
      }
      .navigationViewStyle(.stack)
      .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
      .task {
        xmlManager.loadXml(filename: "WebLayout")
      }
//      .onReceive(viewModel.$searchTerm) { term in
//        if term.count == 0 {
//          currentModel = viewModel.xmlModel
//        } else {
//          currentModel = viewModel.searchResultsModel
//        }
//      }
      .onReceive(viewModel.$searchResultsModel) { results in
        if $viewModel.searchTerm.wrappedValue.count == 0 {
          print("using model")
          currentModel = viewModel.xmlModel
        } else {
          print("using search")
          currentModel = results //viewModel.searchResultsModel
        }
      }
      .onReceive(xmlManager.$treeData) { tree in
        if let val = tree {
          viewModel.xmlModel.append( val )
          currentModel.append( val )
        }
      }
    }
  
  func ViewAttributes(_ attributes: [String:String]) -> some View {
    VStack(alignment: .leading){
      ForEach(attributes.sorted(by: >), id: \.key) { key, value in
        HStack{
          Text("\(key)").fontWeight(.bold)
          Text("\(value)")
        }
      }
    }
  }
  
}

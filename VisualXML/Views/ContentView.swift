//
//  ContentView.swift
//  VisualXML
//
//  Created by Richard Meitzler on 7/15/21.
//

import SwiftUI
import XMLTree
import FirehouseModel

struct ContentView: View {
  static var filename = "KHWeb_formatted"
  @StateObject var modelManager: ModelManagerTest = ModelManagerTest(filename: ContentView.filename)
  
  //@StateObject var xmlManager: XMLManager = XMLManager()
  @StateObject var viewModel: VXMLViewModel = VXMLViewModel()
  
  @State var selectedTree: XMLTree?
  @State var currentModel: [XMLTree] = []
  
    var body: some View {
      //SearchResultsHeader(viewModel: viewModel)
      //VStack(alignment: .leading) {
        
      NavigationView {
        //VStack {
        
          //SearchResultsHeader(viewModel: viewModel)
          List {
//            SearchHistoryView(viewModel: viewModel)
//              .frame(maxWidth: .infinity)
//            if viewModel.searchTerm.count > 0 || viewModel.searchHistory.count > 0 {
//              SearchResultsHeader(viewModel: viewModel)
//            }
            
            ForEach(currentModel, id:\.self) { tree in
              NodeDisclosure(viewModel: viewModel, item: tree, selectedTree: $selectedTree)
            }
            
          }
          .listStyle(.insetGrouped)
          //.listStyle(.sidebar)
          //.layoutPriority(1)
          .sheet(item: $selectedTree) { item in
            ViewAttributes(item.attributes).padding()
          }
          //.navigationTitle("\(ContentView.filename)")
          //.navigationBarTitleDisplayMode(.inline)
          //.background(Color.purple)
          
        //}
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.navigationBarItems(leading: SearchResultsHeader(viewModel: viewModel))
        .toolbar {
          ToolbarItem(placement: .principal) {
            SearchResultsHeader(viewModel: viewModel)
          }
        }
      }
      .navigationViewStyle(.stack)
      //.navigationBarHidden(true)
      //.searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
      .searchable(text: $viewModel.searchRequest.searchText, placement: .automatic)
      //}// end vstack
      .task {
 //       xmlManager.loadXml(filename: "KingsLayout")
        //modelManager.xmlManager.loadXml(filename: "WebLayout")
      }
//      .onReceive(viewModel.$searchTerm) { term in
//        if term.count == 0 {
//          currentModel = viewModel.xmlModel
//        } else {
//          currentModel = viewModel.searchResultsModel
//        }
//      }
      .onReceive(viewModel.$searchRequest) { request in
        if request.searchText == "" && request.searchType == .exactMatch {
          viewModel.searchRequest.searchType = .containsTerm
        }
      }
      .onReceive(viewModel.$searchResultsModel) { results in
        if $viewModel.searchRequest.searchText.wrappedValue.count == 0 {
          print("using model")
          currentModel = viewModel.xmlModel
        } else {
          print("using search")
          currentModel = results //viewModel.searchResultsModel
        }
      }
      .onReceive(modelManager.$xmlModel) { model in
        if let xml = model {
          viewModel.xmlModel = xml
          currentModel = xml
        }
      }
//      .onReceive(modelManager.xmlManager.$treeData) { tree in
//        if let val = tree {
//          viewModel.xmlModel.append( val )
//          currentModel.append( val )
//        }
//      }
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

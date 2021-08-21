//
//  NodeDisclosure.swift
//  NodeDisclosure
//
//  Created by Richard Meitzler on 8/21/21.
//

import SwiftUI

struct NodeDisclosure: View {
  @ObservedObject var viewModel: VXMLViewModel
  
  @State var isExpanded: Bool = false
  @State var isVisible: Bool = true
  @State var item : XMLTree
  
  @Binding var selectedTree: XMLTree?
//  @Binding var searchResults: [UUID]
//  @Binding var expandedParents: [UUID]
  
    var body: some View {
      //Group {
        if isVisible {
          DisclosureGroup(isExpanded: $isExpanded) {
            if let kids = item.children {
              ForEach(kids, id:\.self) { tree in
                if tree.children?.count ?? 0 > 0 {
                  NodeDisclosure(viewModel: viewModel, item: tree, selectedTree: $selectedTree)
                } else {
                  NodeRow(viewModel: viewModel, item: tree, selectedTree: $selectedTree)
                }
              }
            }
          } label: {
            NodeRow(viewModel: viewModel, item: item, selectedTree: $selectedTree)
          }
        } else {
          EmptyView()
        }
      //}
      
      
      EmptyView()
        .onReceive(viewModel.$visibleNodeIds) { visibleIds in
          withAnimation(){
            if visibleIds.count == 0 {
              isExpanded = false
            } else {
              if visibleIds.contains(item.id) {
                //isVisible = true
                isExpanded = true
              } else {
                //isVisible = false
                isExpanded = false
              }
            }
          }
      }
      
      
//      .onChange(of: expandedParents) { parents in
//        withAnimation() {
//          if parents.contains(item.id) {
//            isExpanded = true
//          } else {
//            isExpanded = false
//          }
//        }
//      }
    }
}


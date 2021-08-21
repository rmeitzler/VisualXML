//
//  VXMLViewModel.swift
//  VXMLViewModel
//
//  Created by Richard Meitzler on 8/21/21.
//

import SwiftUI
import Combine

class VXMLViewModel: ObservableObject {
  @Published var xmlModel: [XMLTree] = []
  @Published var searchResultsModel: [XMLTree] = []
  @Published var searchTerm: String = ""
  @Published var searchText: String = ""
  @Published var visibleNodeIds: [UUID] = []
  @Published var searchResultMatches: [UUID] = []
  
  var cancellable: Set<AnyCancellable> = []
  
  init() {
    $searchText
      .debounce(for: .seconds(1), scheduler: RunLoop.main)
      .compactMap{ $0 }
      .sink { (_) in
      } receiveValue: { [self] term in
        
        let results = XMLTree.search(node: xmlModel.first!, for: term)
        searchTerm = term
        
        if results.count > 0 {
          searchResultMatches = results.map({$0.id})
          let visibleIds = collectVisibleIds(from: results)
          
          searchResultsModel = prepareResultsModel(visibleIds: visibleIds, matchingNodes: results)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            visibleNodeIds = visibleIds
          }
        } else {
          visibleNodeIds = []
          searchResultMatches = []
          searchResultsModel = []
        }
        
      }.store(in: &cancellable)
  }
  
  func collectVisibleIds(from trees: [XMLTree]) -> [UUID] {
    var output: [UUID] = []
    let mainIds: [UUID] = trees.map({$0.id})
    let parentIds: [UUID] = trees.flatMap({$0.breadcrumb.map({$0.id})})
    
    output.append(contentsOf: mainIds)
    output.append(contentsOf: parentIds)
    
    let out = output.unique()
    return out
  }
  
  func prepareResultsModel(visibleIds:[UUID], matchingNodes:[XMLTree]) -> [XMLTree] {
    var result: [XMLTree] = []
    let base = xmlModel
    
    for item in base {
      let newItem = purgeChildren(node: item, keepers: visibleIds)
      result.append(newItem)
    }
    result[0].regenerateId()
    
    return result
  }
  
  func purgeChildren(node: XMLTree, keepers: [UUID]) -> XMLTree {
    var mutatingNode = node
    
    if let kids = node.children {
      for child in kids {
        mutatingNode.removeChild(child)
        if keepers.contains(child.id) {
          let newKid = purgeChildren(node: child, keepers: keepers)
          mutatingNode.addChild(newKid)
        }
      }
    }
    
    return mutatingNode
  }
  
}

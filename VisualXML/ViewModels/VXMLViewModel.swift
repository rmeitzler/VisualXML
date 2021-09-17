//
//  VXMLViewModel.swift
//  VXMLViewModel
//
//  Created by Richard Meitzler on 8/21/21.
//

import SwiftUI
import Combine
import XMLTree

class VXMLViewModel: ObservableObject {
  @Published var xmlModel: [XMLTree] = []
  
  @Published var searchResultsModel: [XMLTree] = []
  @Published var searchRequest: SearchRequest = SearchRequest.empty()
  @Published var searchTerm: String = ""
  //@Published var searchText: String = ""
  @Published var searchResultMatches: [UUID] = []
  //@Published var searchType: XMLTree.XMLSearchType = .containsTerm
  
  @Published var searchHistory: [String] = []
  @Published var visibleNodeIds: [UUID] = []
  
  
  var cancellable: Set<AnyCancellable> = []
  
  init() {
    func clearSearch() {
      visibleNodeIds = []
      searchResultMatches = []
      searchResultsModel = []
    }
    
    $searchRequest
      .debounce(for: .seconds(2), scheduler: RunLoop.main)
      .compactMap{ $0 }
      .sink { (_) in
      } receiveValue: { [self] request in
        if request.searchText == "" {
          clearSearch()
        } else {
          var results: [XMLTree] = []
          if let first = xmlModel.first {
            results = XMLTree.search(node: first, for: request.searchText, type: request.searchType)
          }
          searchHistory.append(request.searchText)
          searchTerm = request.searchText
          
          if results.count > 0 {
            searchResultMatches = results.map({$0.id})
            let visibleIds = collectVisibleIds(from: results)
            
            searchResultsModel = prepareResultsModel(visibleIds: visibleIds, matchingNodes: results)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              visibleNodeIds = visibleIds
            }
          } else {
            clearSearch()
          }
        }
        
      }.store(in: &cancellable)
  }
  
  func collectVisibleIds(from trees: [XMLTree]) -> [UUID] {
    var output: [UUID] = []
    let mainIds: [UUID] = trees.map({ $0.id })
    let parentIds: [UUID] = trees.flatMap({$0.breadcrumb.map({$0.id})})
    let childrenIds:[UUID] = trees.flatMap({ spider($0, vals: []) })
    print("visible kids:\( childrenIds )")
    
    output.append(contentsOf: mainIds)
    output.append(contentsOf: parentIds)
    output.append(contentsOf: childrenIds)
    
    let out = output.unique()
    return out
  }
  
  func spider(_ node: XMLTree, vals: [UUID]) -> [UUID] {
    var mutableVals: [UUID] = vals
    mutableVals.append(node.id)
    
    if let kids = node.children {
      mutableVals = kids.flatMap({ spider($0, vals: mutableVals) })
    }
    
    return mutableVals
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

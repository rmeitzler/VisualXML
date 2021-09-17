//
//  SearchRequest.swift
//  SearchRequest
//
//  Created by Richard Meitzler on 8/28/21.
//

import SwiftUI
import XMLTree

struct SearchRequest {
  var searchText: String
  var searchType: XMLTree.XMLSearchType = .containsTerm
  
  static func empty() -> SearchRequest {
    return SearchRequest.init(searchText: "")
  }
}

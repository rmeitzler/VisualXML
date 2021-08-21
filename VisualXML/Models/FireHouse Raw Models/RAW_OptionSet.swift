//
//  OptionSet.swift
//  OptionSet
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_OptionSet: Decodable {
  var id: String
  var name: String
  var isVisible: String
  var groups: RAW_Groups
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case name = "Name"
     case isVisible = "IsVisible"
     case groups = "Groups"
  }
}

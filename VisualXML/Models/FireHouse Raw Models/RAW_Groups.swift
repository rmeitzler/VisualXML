//
//  Groups.swift
//  Groups
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Groups: Decodable {
  var groups: [RAW_Group]
  
  enum CodingKeys: String, CodingKey {
      case groups = "Group"
  }
}

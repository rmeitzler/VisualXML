//
//  OptionGroups.swift
//  OptionGroups
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_OptionGroups: Decodable {
  var groups: [RAW_OptionGroup]
  
  enum CodingKeys: String, CodingKey {
      case groups = "OptionGroup"
  }
}

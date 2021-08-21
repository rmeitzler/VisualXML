//
//  SubMenuMenuItems.swift
//  SubMenuMenuItems
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SubMenuMenuItems: Decodable {
  var itemIds: [String]
  
  enum CodingKeys: String, CodingKey {
      case itemIds = "Id"
  }
}

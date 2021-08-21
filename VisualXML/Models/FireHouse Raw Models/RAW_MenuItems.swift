//
//  MenuItems.swift
//  MenuItems
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuItems: Decodable {
  var items: [RAW_MenuItem]
  
  enum CodingKeys: String, CodingKey {
      case items = "MenuItem"
  }
}

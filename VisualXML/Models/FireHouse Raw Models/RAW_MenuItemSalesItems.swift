//
//  MenuItemSalesItems.swift
//  MenuItemSalesItems
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuItemSalesItems: Decodable {
  var ids: [String]
  
  enum CodingKeys: String, CodingKey {
      case ids = "Id"
  }
}

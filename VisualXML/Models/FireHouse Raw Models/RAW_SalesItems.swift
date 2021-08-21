//
//  SalesItems.swift
//  SalesItems
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SalesItems: Decodable {
  var items: [RAW_SalesItem]
  
  enum CodingKeys: String, CodingKey {
      case items = "SalesItem"
  }
}

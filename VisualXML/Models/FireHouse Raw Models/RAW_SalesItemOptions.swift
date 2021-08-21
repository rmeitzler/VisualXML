//
//  SalesItemOptions.swift
//  SalesItemOptions
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SalesItemOptions: Decodable {
  var options: [RAW_SalesItemOption]
  
  enum CodingKeys: String, CodingKey {
      case options = "SalesItemOption"
  }
}

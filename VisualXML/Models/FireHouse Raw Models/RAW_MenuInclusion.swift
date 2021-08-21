//
//  MenuInclusion.swift
//  MenuInclusion
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuInclusion: Decodable {
  var entries: [RAW_Entry]
  
  enum CodingKeys: String, CodingKey {
    case entries = "Entry"
  }
}

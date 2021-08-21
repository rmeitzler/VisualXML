//
//  Options.swift
//  Options
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Options: Decodable {
  var options: [RAW_Option]
  
  enum CodingKeys: String, CodingKey {
      case options = "Option"
  }
}

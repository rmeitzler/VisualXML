//
//  DefaultOptions.swift
//  DefaultOptions
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_DefaultOptions: Decodable {
  var options: [RAW_DefaultOption]
  
  enum CodingKeys: String, CodingKey {
      case options = "Option"
  }
}

//
//  OptionSets.swift
//  OptionSets
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_OptionSets: Decodable {
  var sets: [RAW_OptionSet]
  
  enum CodingKeys: String, CodingKey {
      case sets = "OptionSet"
  }
}

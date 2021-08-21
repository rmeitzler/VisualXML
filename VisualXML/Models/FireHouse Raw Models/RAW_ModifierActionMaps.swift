//
//  ModifierActionMaps.swift
//  ModifierActionMaps
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_ModifierActionMaps: Decodable {
  var maps: [RAW_ModifierAction]
  
  enum CodingKeys: String, CodingKey {
      case maps = "ModifierAction"
  }
}

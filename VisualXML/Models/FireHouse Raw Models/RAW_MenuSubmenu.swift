//
//  MenuSubmenu.swift
//  MenuSubmenu
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuSubmenu: Decodable {
  var id: String
  var levelNumber: String
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case levelNumber = "LevelNumber"
  }
}

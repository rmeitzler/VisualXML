//
//  Menus.swift
//  Menus
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Menus: Decodable {
  var menus: [RAW_Menu]
  
  enum CodingKeys: String, CodingKey {
    case menus = "Menu"
  }
}

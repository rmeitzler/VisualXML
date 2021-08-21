//
//  MenuSubmenus.swift
//  MenuSubmenus
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuSubmenus: Decodable {
  var submenus: [RAW_MenuSubmenu]
  
  enum CodingKeys: String, CodingKey {
    case submenus = "SubMenu"
  }
}

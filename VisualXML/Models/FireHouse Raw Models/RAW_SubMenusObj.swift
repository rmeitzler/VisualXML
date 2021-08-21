//
//  SubMenusObj.swift
//  SubMenusObj
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SubMenusObj: Decodable {
  var subs: [RAW_SubMenu]
  
  enum CodingKeys: String, CodingKey {
      case subs = "SubMenu"
  }
}

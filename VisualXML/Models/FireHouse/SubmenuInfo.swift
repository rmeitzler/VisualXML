//
//  SubmenuInfo.swift
//  SubmenuInfo
//
//  Created by Richard Meitzler on 8/3/21.
//

import SwiftUI

struct SubmenuInfo {
  var id: String
  var levelNumber: String
}

extension SubmenuInfo: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case levelNumber = "LevelNumber"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
  
      id = try values.decode(String.self, forKey: .id)
      levelNumber = try values.decode(String.self, forKey: .levelNumber)
  }
}

extension SubmenuInfo: Hashable {
  
}

extension SubmenuInfo: XMLTreeDecodable {
  init(from xml: XMLTree) throws {
    try self.init(id: xml.attr("Id"), levelNumber: xml.attr("LevelNumber"))
  }
}

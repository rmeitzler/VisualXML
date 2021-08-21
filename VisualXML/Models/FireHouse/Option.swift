//
//  Option.swift
//  Option
//
//  Created by Richard Meitzler on 8/3/21.
//

import SwiftUI

struct Option {
  var id: String
  var isFolder: String
  var modifierGroupId: String
  var price: String
  var modifierAction: String
  var weight: String
  var customFields: String?
}

extension Option: Decodable {
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case isFolder = "IsFolder"
     case modifierGroupId = "ModifierGroupId"
     case price = "Price"
     case modifierAction = "ModifierAction"
     case weight = "Weight"
     case customFields = "CustomFields"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
  
    id = try values.decode(String.self, forKey: .id)
    isFolder = try values.decode(String.self, forKey: .isFolder)
    modifierGroupId = try values.decode(String.self, forKey: .modifierGroupId)
    price = try values.decode(String.self, forKey: .price)
    modifierAction = try values.decode(String.self, forKey: .modifierAction)
    weight = try values.decode(String.self, forKey: .weight)
    customFields = try values.decodeIfPresent(String.self, forKey: .customFields)
  }
}

extension Option: Hashable {
  
}

extension Option: XMLTreeDecodable {
  init(from xml: XMLTree) throws {
    
    try self.init(id: xml.attr("Id"),
              isFolder: xml.attr("IsFolder"),
              modifierGroupId: xml.attr("ModifierGroupId"),
              price: xml.attr("Price"),
              modifierAction: xml.attr("ModifierAction"),
              weight: xml.attr("Weight"),
              customFields: xml.attrIfPresent("CustomFields"))
  }
}

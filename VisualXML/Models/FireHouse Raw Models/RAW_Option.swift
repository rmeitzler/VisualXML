//
//  Option.swift
//  Option
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Option: Decodable {
  var id: String
  var isFolder: String
  var modifierGroupId: String
  var price: String
  var modifierAction: String
  var weight: String
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case isFolder = "IsFolder"
     case modifierGroupId = "ModifierGroupId"
     case price = "Price"
     case modifierAction = "ModifierAction"
     case weight = "Weight"
     case customFields = "CustomFields"
  }
}

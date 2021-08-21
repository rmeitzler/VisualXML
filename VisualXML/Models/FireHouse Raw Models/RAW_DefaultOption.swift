//
//  DefaultOption.swift
//  DefaultOption
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_DefaultOption: Decodable {
  var id: String
  var entityType: String
  var itemOptionGroupId: String
  var salesItemOptionId: String
  var defaultReason: String
  var defaultQuantity: String
  var modifierAction: String
  
  enum CodingKeys: String, CodingKey {
      case id = "Id"
      case entityType = "EntityType"
      case itemOptionGroupId = "ItemOptionGroupId"
      case salesItemOptionId = "SalesItemOptionId"
      case defaultReason = "DefaultReason"
      case defaultQuantity = "DefaultQuantity"
      case modifierAction = "ModifierAction"
  }
}

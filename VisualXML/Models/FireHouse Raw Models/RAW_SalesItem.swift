//
//  SalesItem.swift
//  SalesItem
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SalesItem: Decodable {
  var id: String
  var itemId: String
  var name: String
  var displayName: String
  var description: String
  var receiptDescription: String
  var price: String
  var itemOptionSetId: String
  var isVisible: String
  var canBeOrderedAsIs: String
  var itemOrderingMode: String
  var sourceItemId: String
  var taxGroupId: String
  var portionCount: String
  var quantityMultiplier: String
  var includedModifierCount: String
  var discountPrice: String
  var freeModifierCount: String
  var caloricValue: String?
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case itemId = "ItemId"
     case name = "Name"
     case displayName = "DisplayName"
     case description = "Description"
     case receiptDescription = "ReceiptDescription"
     case price = "Price"
     case itemOptionSetId = "ItemOptionSetId"
     case isVisible = "IsVisible"
     case canBeOrderedAsIs = "CanBeOrderedAsIs"
     case itemOrderingMode = "ItemOrderingMode"
     case sourceItemId = "SourceItemId"
     case taxGroupId = "TaxGroupId"
     case portionCount = "PortionCount"
     case quantityMultiplier = "QuantityMultiplier"
     case includedModifierCount = "IncludedModifierCount"
     case discountPrice = "DiscountPrice"
     case freeModifierCount = "FreeModifierCount"
     case caloricValue = "CaloricValue"
     case customFields = "CustomFields"
  }
}

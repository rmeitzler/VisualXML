//
//  SalesItemOption.swift
//  SalesItemOption
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SalesItemOption: Decodable {
  var id: String
  var modifierId: String
  var name: String
  var displayName: String
  var description: String
  var receiptDescription: String
  var isVisible: String
  var itemOptionSetId: String
  var sourceModifierId: String
  var taxGroupId: String
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case modifierId = "ModifierId"
     case name = "Name"
     case displayName = "DisplayName"
     case description = "Description"
     case receiptDescription = "ReceiptDescription"
     case isVisible = "IsVisible"
     case itemOptionSetId = "ItemOptionSetId"
     case sourceModifierId = "SourceModifierId"
     case taxGroupId = "TaxGroupId"
     case customFields = "CustomFields"
  }
}

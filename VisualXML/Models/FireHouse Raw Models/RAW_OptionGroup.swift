//
//  OptionGroup.swift
//  OptionGroup
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_OptionGroup: Decodable {
  var id: String
  var isFolder: String
  var name: String
  var displayName: String
  var description: String
  var modifierActionGroupId: String
  var isVisible: String
  var minimumItems: String
  var maximumItems: String
  var perOptionMaximum: String
  var perOptionMinimum: String
  var maxDistinctOptions: String
  var sourceModifierGroupId: String
  var itemOrderingMode: String
  var freeModifiers: String
  var hideModifier: String
  
  var options: RAW_Options
  
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case isFolder = "IsFolder"
     case name = "Name"
     case displayName = "DisplayName"
     case description = "Description"
     case modifierActionGroupId = "ModifierActionGroupId"
     case isVisible = "IsVisible"
     case minimumItems = "MinimumItems"
     case maximumItems = "MaximumItems"
     case perOptionMaximum = "PerOptionMaximum"
     case perOptionMinimum = "PerOptionMinimum"
     case maxDistinctOptions = "MaxDistinctOptions"
     case sourceModifierGroupId = "SourceModifierGroupId"
     case itemOrderingMode = "ItemOrderingMode"
     case freeModifiers = "FreeModifiers"
     case hideModifier = "HideModifier"
     case options = "Options"
     case customFields = "CustomFields"
  }
}

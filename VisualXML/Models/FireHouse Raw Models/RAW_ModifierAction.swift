//
//  ModifierAction.swift
//  ModifierAction
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_ModifierAction: Decodable {
  var modifierActionGroupId: String
  var modifierAction: String
  var action: String
  var displayName: String
  var displayShortName: String
  
  enum CodingKeys: String, CodingKey {
    case modifierActionGroupId = "ModifierActionGroupId"
    case modifierAction = "ModifierAction"
    case action = "Action"
    case displayName = "DisplayName"
    case displayShortName = "DisplayShortName"
  }
}

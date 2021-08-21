//
//  SubMenu.swift
//  SubMenu
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_SubMenu: Decodable {
  var id: String
  var name: String
  var description: String
  var isVisible: String
  var isSelectable: String
  var sourceSubMenuId: String
  var isShowHeader: String
  var supportedOrderModes: String
  
  var menuItems: RAW_SubMenuMenuItems
  
  var restrictions: RAW_Restrictions?
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case name = "Name"
    case description = "Description"
    case isVisible = "IsVisible"
    case isSelectable = "IsSelectable"
    case sourceSubMenuId = "SourceSubMenuId"
    case isShowHeader = "IsShowHeader"
    case supportedOrderModes = "SupportedOrderModes"
    case menuItems = "MenuItems"
    case restrictions = "Restrictions"
    case customFields = "CustomFields"
  }
}

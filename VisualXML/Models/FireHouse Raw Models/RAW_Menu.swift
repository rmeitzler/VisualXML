//
//  Menu.swift
//  Menu
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Menu: Decodable {
  var id: String
  var name: String
  var isVisible: String
  var sourceMenuId: String
  var menuType: String
  var externalId: String
  var supportedOrderModes: String
  var menuAttributes: String
  
  var submenus: RAW_MenuSubmenus?
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case name = "Name"
    case isVisible = "IsVisible"
    case sourceMenuId = "SourceMenuId"
    case menuType = "MenuType"
    case externalId = "ExternalId"
    case supportedOrderModes = "SupportedOrderModes"
    case menuAttributes = "MenuAttributes"
    case submenus = "SubMenus"
  }
}

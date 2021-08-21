//
//  Layout.swift
//  Layout
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Layout: Decodable {
  var menuItems: RAW_MenuItems
  var menuItemInclusion: String?
  var salesItems: RAW_SalesItems
  var salesGroups: String?
  var salesItemOptions: RAW_SalesItemOptions
  var subMenus: RAW_SubMenusObj
  var subMenuInclusion: String?
  var menus: RAW_Menus
  var menuInclusion: RAW_MenuInclusion
  var defaultOptions: RAW_DefaultOptions
  var optionGroups: RAW_OptionGroups
  var optionSets: RAW_OptionSets
  var modifierActionMaps: RAW_ModifierActionMaps
  var quickCombos: String?
  var pizzaConfig: RAW_PizzaConfig
  
  enum CodingKeys: String, CodingKey {
    case menuItems = "MenuItems"
    case menuItemInclusion = "MenuItemInclusion"
    case salesItems = "SalesItems"
    case salesGroups = "SalesGroups"
    case salesItemOptions = "SalesItemOptions"
    case subMenus = "SubMenus"
    case subMenuInclusion = "SubMenuInclusion"
    case menus = "Menus"
    case menuInclusion = "MenuInclusion"
    case defaultOptions = "DefaultOptions"
    case optionGroups = "OptionGroups"
    case optionSets = "OptionSets"
    case modifierActionMaps = "ModifierActionMaps"
    case quickCombos = "QuickCombos"
    case pizzaConfig = "PizzaConfig"
  }
}

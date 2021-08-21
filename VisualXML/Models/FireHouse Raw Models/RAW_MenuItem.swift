//
//  MenuItem.swift
//  MenuItem
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_MenuItem: Decodable {
  var id: String
  var name: String
  var displayName: String
  var description: String
  var defaultItemId: String
  var isVisible: String
  var itemOrderingMode: String
  var forceInitialQuantitySelection: String
  var layoutBindingTag: String?
  var baseImageName: String?
  var sourceItemId: String
  var listImageName: String?
  var promotionType: String
  var promotionDescription: String?
  var promotionMenuItemId: String
  var promoId: String
  var price: String
  var caloricServingUnit: String?
  var supportedOrderModes: String
  
  var salesItems: RAW_MenuItemSalesItems
  
  var salesGroups: String?
  var restrictions: RAW_Restrictions
  var customFields: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case name = "Name"
    case displayName = "DisplayName"
    case description = "Description"
    case defaultItemId = "DefaultItemId"
    case isVisible = "IsVisible"
    case itemOrderingMode = "ItemOrderingMode"
    case forceInitialQuantitySelection = "ForceInitialQuantitySelection"
    case layoutBindingTag = "LayoutBindingTag"
    case baseImageName = "BaseImageName"
    case sourceItemId = "SourceItemId"
    case listImageName = "ListImageName"
    case promotionType = "ServEnt:PromotionType"
    //case promotionType = "PromotionType"
    case promotionDescription = "PromotionDescription"
    case promotionMenuItemId = "PromotionMenuItemId"
    case promoId = "PromoID"
    case price = "Price"
    case caloricServingUnit = "CaloricServingUnit"
    case supportedOrderModes = "SupportedOrderModes"
    case salesItems = "SalesItems"
    case salesGroups = "SalesGroups"
    case restrictions = "Restrictions"
    case customFields = "CustomFields"
  }
}

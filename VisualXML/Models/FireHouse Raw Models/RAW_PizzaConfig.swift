//
//  PizzaConfig.swift
//  PizzaConfig
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_PizzaConfig: Decodable {
  var pizzaCategory: String
  var portionPricingMethod: String
  var portionPricingPercent: String
  var section1Id: String
  var section1Type: String
  var section2Id: String
  var section2Type: String
  var section3Id: String
  var section3Type: String
  var section4Id: String
  var section4Type: String
  
  enum CodingKeys: String, CodingKey {
    case pizzaCategory = "PizzaCategory"
    case portionPricingMethod = "PortionPricingMethod"
    case portionPricingPercent = "PortionPricingPercent"
    case section1Id = "Section1Id"
    case section1Type = "Section1Type"
    case section2Id = "Section2Id"
    case section2Type = "Section2Type"
    case section3Id = "Section3Id"
    case section3Type = "Section3Type"
    case section4Id = "Section4Id"
    case section4Type = "Section4Type"
  }
}

//
//  Group.swift
//  Group
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Group: Decodable {
  var id: String
  var isHalfSectionAllowed: String
  var isThirdSectionAllowed: String
  var isFourthSectionAllowed: String
  
  enum CodingKeys: String, CodingKey {
     case id = "Id"
     case isHalfSectionAllowed = "IsHalfSectionAllowed"
     case isThirdSectionAllowed = "IsThirdSectionAllowed"
     case isFourthSectionAllowed = "IsFourthSectionAllowed"
  }
}

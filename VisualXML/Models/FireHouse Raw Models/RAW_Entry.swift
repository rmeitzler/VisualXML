//
//  Entry.swift
//  Entry
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Entry: Decodable {
  var id: String
  var siteGroupId: String
  var isIncluded: String
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case siteGroupId = "SiteGroupId"
    case isIncluded = "IsIncluded"
  }
}

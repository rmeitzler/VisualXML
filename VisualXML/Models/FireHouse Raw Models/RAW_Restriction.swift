//
//  Restriction.swift
//  Restriction
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Restriction: Decodable {
  var importAction: String?
  var dayOfWeek: String
  var startTime: String?
  var endTime: String?
  
  enum CodingKeys: String, CodingKey {
    case importAction = "ImportAction"
    case dayOfWeek = "DayOfWeek"
    case startTime = "StartTime"
    case endTime = "EtartTime"
  }
}

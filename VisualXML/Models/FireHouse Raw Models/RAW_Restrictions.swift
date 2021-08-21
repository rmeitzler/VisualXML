//
//  Restrictions.swift
//  Restrictions
//
//  Created by Richard Meitzler on 7/18/21.
//

import Foundation

struct RAW_Restrictions: Decodable {
  var restrictions: [RAW_Restriction]
  
  enum CodingKeys: String, CodingKey {
    case restrictions = "Restriction"
  }
}

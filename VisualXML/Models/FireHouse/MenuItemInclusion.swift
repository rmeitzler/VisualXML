//
//  MenuItemInclusion.swift
//  MenuItemInclusion
//
//  Created by Richard Meitzler on 8/4/21.
//

import SwiftUI

struct MenuItemInclusion: Decodable, Hashable, XMLTreeDecodable {
  
  init(from decoder: Decoder) throws {
    
  }
  
  init(from xml: XMLTree) throws {
    self.init()
  }
  
  init(){
    
  }
    
}

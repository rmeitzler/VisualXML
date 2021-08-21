//
//  SubmenuInclusion.swift
//  SubmenuInclusion
//
//  Created by Richard Meitzler on 8/3/21.
//

import SwiftUI

struct SubmenuInclusion: Decodable, Hashable, XMLTreeDecodable {
  
  init(from decoder: Decoder) throws {
    
  }
  
  init(from xml: XMLTree) throws {
    self.init()
  }
  
  init(){
    
  }
    
}

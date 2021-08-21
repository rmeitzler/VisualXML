//
//  XMLManager.swift
//  XMLManager
//
//  Created by Richard Meitzler on 7/14/21.
//

import SwiftUI
import XMLCoder

class XMLManager: ObservableObject {
  @Published var xmlData: Data?
  @Published var rawLayout: RAW_Layout?
  @Published var cleanLayout: Layout?
  @Published var treeData: XMLTree?
  
  func loadXml(filename: String) {
    if let filepath = Bundle.main.path(forResource: filename, ofType: "xml") {
        do {
            let contents = try String(contentsOfFile: filepath)
            xmlData = contents.data(using: .utf8)
          
            if let data = xmlData {
              //DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //self.swifty = XML(data: data)
              //}
              //rawLayout = try! XMLDecoder().decode(Layout.self, from: data)
              let parser = ParserObj(data)
              treeData = parser.output
              
              let layout: Layout = try Layout(from: parser.output)
                //print("layout_menuItems:\(layout.menuItems.count)")
              //print("val:\(layout.salesItems))")
              cleanLayout = layout
            }
          
        } catch let XMLTreeError.attributeNotFound(failedKey) {
          print("Could not find attribute: \(failedKey)")
        }
        catch let XMLTreeError.couldNotDecodeClass(className) {
          print("Could not decode \(className)")
        }
        catch {
            print("Could not load file")
          }
    }
  }
  
  func decodeFragment<T: Decodable>(fragment: String) -> T? {
    let xmlData = fragment.data(using: .utf8)
    if let data = xmlData {
      return try! XMLDecoder().decode(T.self, from: data)
    }
    return nil
  }
}




class ParserObj: NSObject, XMLParserDelegate {
  private var parser: XMLParser
  var output: XMLTree = XMLTree(name: "", depth: 0, breadcrumb: [])
  var depth = 0
  var runningBreadcrumb: [XMLSilo] = []
  //var runningParentId: UUID?
  
  var buildingSet: [XMLTree] = []
  
  init(_ data: Data) {
    parser = XMLParser(data: data)
    super.init()
    
    parser.delegate = self
    parser.parse()
  }

  
  public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
      {
        //runningBreadcrumb.append(elementName)
        var element = XMLTree(name: elementName, depth: depth, breadcrumb: runningBreadcrumb)
        runningBreadcrumb.append(XMLSilo(from: element))
        //runningParentId = element.id
        element.attributes = attributeDict
        buildingSet.append(element)
        depth += 1
      }
      
      public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
      {
        //print("ending: \(elementName)")
        
        if let popped = buildingSet.popLast() {
          let idx = buildingSet.count - 1
          if idx >= 0 {
            var mutatingPopped = popped
            //if idx > 0 {
              let parentID = buildingSet[idx].id
              mutatingPopped.updateParent(parentID)
            //}
            buildingSet[idx].addChild(mutatingPopped)
          } else {
            output = popped
          }
        }
        depth -= 1
        runningBreadcrumb = runningBreadcrumb.dropLast()
      }
      
    
      public func parser(_ parser: XMLParser, foundCharacters string: String)
      {
        //print("Characters:\(string)")
        let idx = buildingSet.count - 1
        buildingSet[idx].value = string
      }
      
    
      public func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data)
      {
        //print("Encountered CData")
      }
      
 
      public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error)
      {
        print("Error:\(parseError.localizedDescription)")
      }
}




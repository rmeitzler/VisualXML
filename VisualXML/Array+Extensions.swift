//
//  Array+Extensions.swift
//  Array+Extensions
//
//  Created by Richard Meitzler on 8/21/21.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

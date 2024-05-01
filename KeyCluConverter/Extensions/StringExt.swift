//
//  StringExt.swift
//  KeyCluConverter
//
//  Created by Anze on 26.03.24.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        isEmpty == false
    }
    
    func replace(_ search: String, _ replace: String = "") -> String {
        self.replacingOccurrences(of: search, with: replace)
    }
    
    func trim(_ set: CharacterSet = .whitespacesAndNewlines) -> String {
        self.trimmingCharacters(in: set)
    }
}

extension Substring {
    func trim(_ set: CharacterSet = .whitespacesAndNewlines) -> String {
        self.trimmingCharacters(in: set)
    }
}

//
//  XmlReader.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class XmlReader {
    static func getArrayListFrom(_ file: String, _ key: String) -> [Any] {
        var result: [Any] = []
        
        if let dict = NSDictionary(contentsOfFile: file) as? [String: Any],
           let list = dict[key] as? [Any] {
            result = list
        }
        
        return result
    }
}

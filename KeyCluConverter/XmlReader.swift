//
//  XmlReader.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class XmlReader {
    static func getArrayListFrom(_ file: String, _ key: String = "") -> [Any] {
        var result: [Any] = []
        
        let xmlObject = NSDictionary(contentsOfFile: file)
        if key.isNotEmpty {
            if let dict = xmlObject as? [String: Any],
               let list = dict[key] as? [Any] {
                result = list
            }
        } else {
            if let dict = xmlObject as? [String: Any] {
                //
            }
        }
        
        return result
    }
}


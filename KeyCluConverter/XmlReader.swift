//
//  XmlReader.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class XmlReader {
    static func getArrayListFrom(_ file: String) -> [Any] {
        var result: [Any] = []
        guard let plistData = FileManager.default.contents(atPath: file) else {
            print("Failed to read plist data.")
            return result
        }
        do {
            let plistObject = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil)
            
            guard let rootArray = plistObject as? [[String: Any]] else {
                print("Root object is not an array.")
                return result
            }
            
            result = rootArray
        } catch {
            print("Error parsing plist: \(error)")
        }
        
        return result
    }
}


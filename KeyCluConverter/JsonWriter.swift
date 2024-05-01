//
//  JsonWriter.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation
import Cocoa

class JsonWriter {
    public func customFormatJSON(data: [StringDataSet]) -> String {
        var jsonString = "{\n"
        
        for item in data {
            jsonString += "    \"\(item.Element)\": {\n"
            
            if let groups = item.Data as? [String: ShortcutGroup] {
                for group in groups {
                    jsonString += "        \"\(group.key)\": [\n"
                    for item in group.value.items {
                        jsonString += "            ["
                        jsonString += "\"\(item.title.replace("\\", "\\\\").replace("\"", "\\\""))\""
                        jsonString += ", "
                        jsonString += "\"\(item.modifiers)\""
                        jsonString += ", "
                        jsonString += "\(item.keycode)"
                        jsonString += "],\n"
                    }
                    jsonString.removeLast(2)
                    jsonString += "\n        ],\n"
                }
                jsonString.removeLast(2)
            }
            jsonString += "\n    },\n"
        }
        
        if data.count > 0 {
            jsonString.removeLast(2)
        }
        
        jsonString += "\n}"
        
        return jsonString
    }
}

//
//  XmlReader.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import Foundation

class XmlReader {
    private func getArrayListFrom(_ file: String, _ key: String) -> [Any] {
        var result: [Any] = []
        
        if let dict = NSDictionary(contentsOfFile: file) as? [String: Any],
           let list = dict[key] as? [Any] {
            result = list
        }
        
        return result
    }
    
    public func readData(from file: String) -> [String: ShortcutGroup] {
        var result: [String: ShortcutGroup] = [:]
        let content = getArrayListFrom(file, "shortcuts")
        
        if content.count > 0 {
            var groupName: String = ""
            
            print("Processing \(content.count) elements")
            for item in content {
                guard let dictValues = item as? [String: Any] else { continue }
                if let _ = dictValues["heading"] as? UInt,
                   let title = dictValues["title"] as? String {
                    print("Group: \(title)")
                    groupName = title
                    result[groupName] = ShortcutGroup(title: groupName, items: [])
                } else if groupName.isNotEmpty {
                    if let keycode = dictValues["keycode"] as? Int,
                       let modifiers = dictValues["modifiers"] as? Int,
                       let title = dictValues["title"] as? String
                    {
                        let shortcutItem = ShortcutItem(title: title, keycode: keycode, modifiers: modifiers)
                        print("Shortcut: \(shortcutItem.title) -> \(shortcutItem.modifiers) + \(shortcutItem.keycode)")
                        result[groupName]?.addItem(
                            item: shortcutItem
                        )
                    }
                }
            }
        }
        
        return result
    }
}

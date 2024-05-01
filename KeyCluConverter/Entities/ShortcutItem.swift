//
//  ShortcutItem.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import SwiftUI

class ShortcutItem {
    let title: String
    let keycode: Int
    let modifiers: Int
    
    init(title: String, keycode: Int, modifiers: Int) {
        self.title = title
        self.keycode = keycode
        self.modifiers = modifiers
    }
    
    public func getModifierAsString() -> String {
        let modifierFlags = CGEventFlags(rawValue: UInt64(modifiers))
        var items: [String] = []
        
        if modifierFlags.contains(.maskControl) {
            items.append("control")
        }
        if modifierFlags.contains(.maskAlternate) {
            items.append("option")
        }
        if modifierFlags.contains(.maskShift) {
            items.append("shift")
        }
        if modifierFlags.contains(.maskCommand) {
            items.append("command")
        }
        if modifierFlags.contains(.maskSecondaryFn) {
            items.append("fn")
        }
        
        return items.joined(separator: "+")
    }
}

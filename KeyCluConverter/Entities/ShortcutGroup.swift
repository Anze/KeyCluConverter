//
//  ShortcutGroup.swift
//  KeyCluConverter
//
//  Created by Anze on 01.05.24.
//

import SwiftUI

class ShortcutGroup {
    var title: String
    var items: [ShortcutItem]
    
    init(title: String, items: [ShortcutItem]) {
        self.title = title
        self.items = items
    }
    
    func addItem(item: ShortcutItem) -> Void {
        items.append(item)
    }
}

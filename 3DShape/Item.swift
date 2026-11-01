//
//  Item.swift
//  3DShape
//
//  Created by Volodymyr Kushnir on 01.11.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  Item.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    //var prueba
    var timestamp: Date
    
    
    var fullname: String
    var numeroCuenta: String

    
    init(timestamp: Date, fullname: String, numeroCuenta: String) {
        self.timestamp = timestamp
        self.fullname = fullname
        self.numeroCuenta = numeroCuenta
    }
//    init(timestamp: Date) {
//        self.timestamp = timestamp
//    }
}

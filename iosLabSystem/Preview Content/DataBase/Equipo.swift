//
//  Item.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import Foundation
import SwiftData

@Model
final class Equipo {
    
    
    
    var fullname: String
    var numeroCuenta: String
    var statusEquipo: String
    
    
    init(fullname: String, numeroCuenta: String, statusEquipo: String) {
        self.fullname = fullname
        self.numeroCuenta = numeroCuenta
        self.statusEquipo = statusEquipo
    }
    
}

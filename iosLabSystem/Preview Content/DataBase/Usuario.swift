//
//  Item.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import Foundation
import SwiftData




@Model
class Usuario {
    var fullname: String
    var numeroCuenta: String
    var statusUsuario: String
    
    var Equipos: [Equipo]?
    
    init(fullname: String, numeroCuenta: String, statusUsuario: String, Equipos: [Equipo]? = nil) {
        self.fullname = fullname
        self.numeroCuenta = numeroCuenta
        self.statusUsuario = statusUsuario
        self.Equipos = Equipos
    }
    
}

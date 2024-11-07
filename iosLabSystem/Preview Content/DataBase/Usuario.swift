//
//  Item.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import Foundation
import SwiftData

@Model
final class Usuario {
    var fullname: String
    var numeroCuenta: String
    var statusUsuario: StatusDelUsuario
    var Equipos: [Equipo?]
    
    init(fullname: String, numeroCuenta: String, statusUsuario: StatusDelUsuario, Equipos: [Equipo?]) {
        self.fullname = fullname
        self.numeroCuenta = numeroCuenta
        self.statusUsuario = statusUsuario
        self.Equipos = Equipos
    }
    
}

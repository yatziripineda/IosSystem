//
//  Item.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//
import Foundation
import SwiftData
import Foundation
import SwiftData

@Model
class Equipo {
    
    var model: String
    var type: String  
    var number: Int
    var statusEquipo: Bool
    var fechaPrestamo: Date?
    var fechaDevolucion: Date?
    
    @Relationship(deleteRule: .nullify, inverse: \Usuario.Equipos)
    var usuario: Usuario?
    
    init(model: String, type: String, number: Int, statusEquipo: Bool, fechaPrestamo: Date?, fechaDevolucion: Date?) {
        self.model = model
        self.type = type
        self.number = number
        self.statusEquipo = statusEquipo
        self.fechaPrestamo = fechaPrestamo
    }
    
    // Método para obtener el dispositivo seleccionado como un caso de 'SelectedDevice'
    func selectedDeviceType() -> SelectedDevice? {
        return SelectedDevice.from(type)
    }
}

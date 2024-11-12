//
//  Models.swift
//  iosLabSystem
//
//  Created by yatziri on 07/11/24.
//

import Foundation

enum StatusDelUsuario: String, CodingKey {
    case alumno
    case servicio
    case professor
}
enum SelectedDevice: String, CaseIterable, Identifiable {
    case Mackbook
    case IPad
    case IPhone
    case AppleWatch
    var id: Self { self }
    
// Método para convertir un String a un caso de SelectedDevice si es posible
    static func from(_ string: String) -> SelectedDevice? {
        return SelectedDevice(rawValue: string)
    }
}

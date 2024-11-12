//
//  RecordPrestamosView.swift
//  iosLabSystem
//
//  Created by yatziri on 11/11/24.
//

import SwiftUI
import SwiftData

struct RecordPrestamosView: View {
    @Query private var usuarios: [Usuario]
    @Environment(\.modelContext) var modelContext
    
    @State private var showUserInformation: Bool = false
    @State private var addPrestamo: Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(usuarios) { usuario in
                    HStack {
                        Text(usuario.fullname)
                        Spacer()
                        ForEach(usuario.Equipos! ) { equipo in
                            Text("\(equipo.number)")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
            }.navigationTitle("Prestamos")
                .toolbar {
                    Button("Agregar prestamo") {
                        addPrestamo.toggle()
                    }
                    
                }
                .sheet(isPresented: $addPrestamo) {
                    AddPrestamosView()
                }
        }
    }
}

#Preview {
    RecordPrestamosView()
}

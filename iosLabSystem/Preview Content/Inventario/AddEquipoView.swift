//
//  AddEquipoView.swift
//  iosLabSystem
//
//  Created by yatziri on 11/11/24.
//
import SwiftUI
import SwiftData

struct AddEquipoView: View {
    @Query private var Usuarios: [Usuario]
    @Query private var Equipos: [Equipo]
    
    @State var selectedDevice: SelectedDevice = .Mackbook
    @State private var modelo: String = ""
    @State private var numeroDeEquipo: String = ""
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var equipo: Equipo = Equipo(model: "", type: "", number: 0, statusEquipo: true, fechaPrestamo: nil, fechaDevolucion: nil)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("AGREGAR EQUIPO AL INVENTARIO")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("MODELO")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                TextField("Ingresa el nombre del modelo", text: $equipo.model)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 15)
                
                Text("NÚMERO DEL EQUIPO")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                TextField("Ingresa el número del equipo", text: $numeroDeEquipo)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 15)
                
                Text("TIPO DE DISPOSITIVO")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Picker("", selection: $selectedDevice) {
                    ForEach(SelectedDevice.allCases, id: \.self) { device in
                        Text(device.rawValue).tag(device)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 15)
                
                Spacer()
                
                HStack {
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Agregar Equipo")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .navigationTitle("Nuevo Equipo")
        }
    }
    
    private func save() {
        equipo.type = selectedDevice.rawValue
        equipo.number = Int(numeroDeEquipo) ?? 0
//        let equipo = Equipo(
//            model: modelo,
//            type: selectedDevice.rawValue,
//            number:  Int(numeroDeEquipo) ?? 0,
//            statusEquipo: true,
//            fechaPrestamo: nil,
//            fechaDevolucion: nil
//        )
        
        modelContext.insert(equipo)
        print("Equipo guardado: \(equipo)")
    }
}


#Preview {
    AddEquipoView()
}

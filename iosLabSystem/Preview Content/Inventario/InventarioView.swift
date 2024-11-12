//
//  InventarioView.swift
//  iosLabSystem
//
//  Created by yatziri on 11/11/24.
//
import SwiftUI
import SwiftData

struct InventarioView: View {
    
    @Query private var Usuarios: [Usuario]
    @Query private var Equipos: [Equipo]
    
    @Environment(\.modelContext) var modelContext
    @State private var isPresentingAddEquipoView = false
    @State private var selectedDevice: SelectedDevice = .Mackbook
    
    var body: some View {
        NavigationStack {
            VStack{
                Picker("", selection: $selectedDevice) {
                    ForEach(SelectedDevice.allCases, id: \.self) { device in
                        Text(device.rawValue).tag(device)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
//                VStack(alignment: .leading) {
//                    Text(selectedDevice.rawValue)
//                        .font(.headline)
//                        .padding(.bottom, 5)
//                        .padding()
                    List {
                        ForEach(Equipos.filter { $0.type == selectedDevice.rawValue }) { equi in
                            rowview(equi)
                        }
                    }
//                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isPresentingAddEquipoView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddEquipoView) {
                AddEquipoView()
            }
            .navigationTitle("Inventario")
        }
    }
    func rowview(_ equipo: Equipo) -> some View {
        HStack {
            VStack{
                Text("\(equipo.number)")
                    .font(.title)
                    .padding()
                Text("\(equipo.model)")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("\(equipo.statusEquipo ? "Disponible" : "No disponible")")
               
        }
    }
}


#Preview {
    InventarioView()
}

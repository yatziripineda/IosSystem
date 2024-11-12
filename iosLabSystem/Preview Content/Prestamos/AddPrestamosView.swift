//
//  PrestamosView.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import SwiftUI
import SwiftData





struct AddPrestamosView: View {
    
    @State var selectedDevice: SelectedDevice = .Mackbook
    @State var searchNumber: String = ""
//    @State var fullname: String = ""
//    @State var numeroCuenta: String = ""
//    @State var statusUsuario: String = ""
    
    @Query private var Usuarios: [Usuario]
    @Query private var Equipos: [Equipo]
    
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var usuario: Usuario = Usuario(fullname: "", numeroCuenta: "", statusUsuario: "")
   
    
    var body: some View {
        
        NavigationStack{
//            HStack{
                VStack(alignment: .leading){
                    Text("INGRESA NOMBRE COMPLETO")
                        .foregroundColor(.gray1)
                        .font(.caption)
                    
                    TextField(text: $usuario.fullname) {
                        Text("Nombre Completo")
                            .foregroundStyle(.black)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    Text("INGRESA NÚMERO DE CUENTE")
                        .foregroundColor(.gray1)
                        .padding(.top)
                        .font(.caption)
                    TextField(text: $usuario.numeroCuenta) {
                        Text("Numero de Cuenta")
                            .foregroundStyle(.black)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    
                    Text("SELECCIONE  TIPO DE DISPOSITIVO")
                        .foregroundColor(.gray1)
                        .padding(.top)
                        .font(.caption)
                    
                    Picker("", selection: $selectedDevice) {
                        Text("Mackbook").tag(SelectedDevice.Mackbook)
                        Text("IPad").tag(SelectedDevice.IPad)
                        Text("IPhone").tag(SelectedDevice.IPhone)
                        Text("AppleWatch").tag(SelectedDevice.AppleWatch)
                    }.pickerStyle(.segmented)
                    ZStack {
                        Color.search.opacity(0.7)
                            .cornerRadius(20)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray3)
                            TextField("Search", text: $searchNumber)
                                .textFieldStyle(.plain)
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 200, height: 25)
                    
                    List {
                        ForEach(Equipos.filter { equipo in
                            equipo.type == selectedDevice.rawValue &&
                            equipo.statusEquipo == true &&
                            (Int(searchNumber) == nil || equipo.number == Int(searchNumber))
                        }) { equi in
                            buttonview(equi)
                        }
                    }.listStyle(.plain)
                    Spacer()
                    HStack{
                        Button {
                            save()
                            dismiss()
                            
                        } label: {
                            Text("Registrar prestamo")
                        }.buttonStyle(.plain)
                        Spacer()
                        Button {
                            dismiss()
                            
                        } label: {
                            Text("Cancel")
                        }.buttonStyle(.plain)
                        
                    }

                }
                .padding()
                .navigationTitle("Prestamos")
//            }
        }
    }
    func buttonview(_ equipo: Equipo) -> some View {
        HStack{
            Button {
                usuario.Equipos!.append(equipo)
            } label: {
                Text("\(equipo.number)")
            }.buttonStyle(.plain)
        }
    }
    
}


private extension  AddPrestamosView {
    
    func save() {
        modelContext.insert(usuario)
        
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Usuario.self, inMemory: true)
}


#Preview {
    AddPrestamosView()
        .modelContainer(for: Usuario.self, inMemory: true)
}



//
//  PrestamosView.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import SwiftUI


enum SelectedDevice: String, CaseIterable, Identifiable {
    case Mackbook, IPad, IPhone, AppleWatch
    var id: Self { self }
}


struct PrestamosView: View {
    
    @State var selectedDevice: SelectedDevice = .Mackbook
    var body: some View {
        
        NavigationStack{
            HStack{
                VStack(alignment: .leading){
                    Text("INGRESA NOMBRE COMPLETO")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                    
                    TextField(text: .constant("")) {
                        Text("Nombre Completo")
                            .foregroundStyle(.black)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    Text("INGRESA NÚMERO DE CUENTE")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                        .padding(.top)
                    TextField(text: .constant("")) {
                        Text("Numero de Cuenta")
                            .foregroundStyle(.black)
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    
                    Text("SELECCIONE  TIPO DE DISPOSITIVO")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                        .padding(.top)
                    
                    Picker("", selection: $selectedDevice) {
                        Text("Mackbook").tag(SelectedDevice.Mackbook)
                        Text("IPad").tag(SelectedDevice.IPad)
                        Text("IPhone").tag(SelectedDevice.IPhone)
                        Text("AppleWatch").tag(SelectedDevice.AppleWatch)
                    }.pickerStyle(.segmented)
                    Text("SELECCIONE  DISPOSITIVO DISPONIBLE")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                        .padding(.top)
                    ZStack {
                        Color.search.opacity(0.7)
                            .cornerRadius(20)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray3)
                            TextField("Search", text: .constant(""))
                                .textFieldStyle(.plain)
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 200, height: 25)

                    
                    Spacer()
                }.navigationTitle("Prestamos")
                .padding()
                Spacer()
            }
        }
        // Body/Regular
//        HStack(alignment: .bottom, spacing: 0) {
//            Text("Nombre Completo")
//                .font(Font.custom("SF Pro", size: 17))
//                .foregroundColor(Constants.LabelsSecondary)
//                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .topLeading)
//        }
//        .padding(.horizontal, 8)
//        .padding(.vertical, 7)
//        .frame(maxWidth: .infinity, alignment: .bottom)
//        .background(Constants.FillsTertiary)
//        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


#Preview {
    PrestamosView()
}



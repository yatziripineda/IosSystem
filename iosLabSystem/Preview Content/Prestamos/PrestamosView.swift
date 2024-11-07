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
                    TextField("Nombre Completo", text: .constant(""))
                        .padding()
                        .foregroundStyle(.black)
                        .frame(width: 450,height: 30)
                        .background(.gray.opacity(10))
                        .cornerRadius(10)
                    Text("INGRESA NÚMERO DE CUENTE")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                        .padding(.top)
                    TextField("Numero de Cuenta", text: .constant(""))
                        .padding(.horizontal)
                        .foregroundStyle(.black)
                        .frame(width: 450,height: 30)
                        .background(.gray.opacity(10))
                        .cornerRadius(10)
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
                    Spacer()
                    ZStack {
                        Color.gray3.opacity(0.7)
                            .cornerRadius(20)
                        TextField("\(Image(systemName: "magnifyingglass"))  Search", text: .constant(""))
                            .padding(.horizontal)
                            .padding(.vertical, 7.5)
                    }
                    .padding()
                    
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
    PrestamosView()
}



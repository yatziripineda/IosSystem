//
//  DevolucionView.swift
//  iosLabSystem
//
//  Created by yatziri on 11/11/24.
//

import SwiftUI



struct DevolucionView: View {
    
    //@State var selectedDevice: SelectedDevice = .Mackbook
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
                    
                    .pickerStyle(.segmented)
                    Text("DISPOSITIVOS PRESTADOS")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray1)
                        .padding(.top)
                }
            }
            .navigationTitle("Devolución")
            .padding()
            Spacer()
        }
    }
}


#Preview {
    DevolucionView()
}

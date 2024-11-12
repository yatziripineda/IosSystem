//
//  ContentView.swift
//  iosLabSystem
//
//  Created by yatziri on 06/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var Usuarios: [Usuario]

    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    RecordPrestamosView()
                } label: {
                    Text("Prestamos")
                        
                }
                NavigationLink {
                    DevolucionView()
                } label: {
                    Text("Devolución")
                        
                }
                NavigationLink {
                    InventarioView()
                } label: {
                    Text("Inventario")
                        
                }
                
                
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
            }
        } detail: {
            AddPrestamosView()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Usuario.self, inMemory: true)
}

//
//  ContentView.swift
//  KickerTurnier
//
//  Created by Elias Breitenbach on 04.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var turnierListen: [String] = []
    @State private var newTextInput = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(turnierListen, id: \.self) { turnierListe in
                    Text(turnierListe)
                }
            }
            
                Spacer()
                Button("Turnier Name hinzufügen") {
                    showAlert = true
                }
                .font(.title3)
                
                .alert("Bitte geben Sie einen Namen für das neue Turnier ein:", isPresented: $showAlert, actions: {
                    TextField("TextField", text: $newTextInput)
                    
                    Button("Abbrechen", role: .cancel, action: {})
                    Button("Erstellen", action: {
                        self.turnierListen.append(self.newTextInput)
                        self.newTextInput = ""
                    })
                })
        }
    }
}

#Preview {
    ContentView()
}

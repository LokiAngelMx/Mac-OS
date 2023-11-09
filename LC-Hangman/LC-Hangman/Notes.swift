import Foundation
import SwiftUI

struct Note {
    var text: String
    var textColor: Color = .black
    var backgroundColor: Color = .white
}

struct NotesView: View {
    @State private var notes: [Note] = [Note(text: "Ejemplo de nota")]
    @State private var currentNoteText: String = ""
    @State private var currentTextColor: Color = .black
    @State private var currentBackgroundColor: Color = .white
    
    var body: some View {
        VStack {
            List {
                ForEach(notes, id: \.text) { note in
                    HStack {
                        Text(note.text)
                            .foregroundColor(note.textColor)
                            .padding()
                            .background(note.backgroundColor)
                            .cornerRadius(8)
                    }
                }
            }
            
            HStack {
                TextField("Nueva nota...", text: $currentNoteText)
                ColorPicker("Texto", selection: $currentTextColor)
                ColorPicker("Fondo", selection: $currentBackgroundColor)
                
                Button("Agregar nota") {
                    let newNote = Note(text: currentNoteText, textColor: currentTextColor, backgroundColor: currentBackgroundColor)
                    notes.append(newNote)
                    currentNoteText = ""
                }
            }.padding()
        }
    }
}

#Preview {
    NotesView()
}

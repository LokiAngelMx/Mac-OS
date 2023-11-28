import Foundation
import SwiftUI

struct FormView: View {
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var edad: String = ""
    var dbContext: NSManagedObjectContext
    var onSave: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Apellido", text: $apellido)
                TextField("Edad", text: $edad)
                HStack {
                    Button("Guardar", action: {
                        let nuevoAlumno = Alumno(context: dbContext)
                        nuevoAlumno.nombre = nombre
                        nuevoAlumno.apellido = apellido
                        nuevoAlumno.edad = Int16(edad) ?? 0
                        nuevoAlumno.id = UUID()
                        onSave()
                    })
                    Button("Cancelar", action: onCancel)
                }
            }.formStyle(.grouped)
        }.padding()
    }
}

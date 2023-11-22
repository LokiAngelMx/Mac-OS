import Foundation
import SwiftUI

struct FormView: View {
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    // Los TextField spor defecto solo aceptan strings
    @State private var precio: String = ""
    var dbContext: NSManagedObjectContext
    var onSave: () -> Void
    
    var body: some View {
        VStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Descripción", text: $descripcion)
                TextField("Precio", text: $precio)
                HStack {
                    Button("Guardar", action: {
                        let nuevoProducto = Producto(context: dbContext)
                        nuevoProducto.nombre = nombre
                        nuevoProducto.descripcion = descripcion
                        nuevoProducto.precio = Float(precio) ?? 0
                        nuevoProducto.id = UUID()
                        // Para guardar simplemente tienen que llamar a save() del contexto
                        // dbContext.save()
                        onSave()
                    })
                }
            }.formStyle(.grouped)
        }.padding()
    }
}

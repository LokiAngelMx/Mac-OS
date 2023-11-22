import SwiftUI
import CoreData

struct ContentView: View {
    // ViewContext nos permite la actualizacion, añadir, eliminar, etc
    // Los items de los modelos o entidades
    @Environment(\.managedObjectContext) private var viewContext

    // Obtener de la base de datos los items de la entidad que le pasemos
    // En este caso le decimos que los va a obtener por su id
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Producto.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Producto>
    @State private var mostrarFormulario: Bool = false
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var precio: String = ""

    var body: some View {
        if !mostrarFormulario {
            NavigationView {
                List {
                    ForEach(items) { producto in
                        NavigationLink(destination: {
                            List {
                                TextField("Nombre", text: $nombre)
                                TextField("Descripción", text: $descripcion)
                                TextField("Precio", text: $precio)
                                
                                Button(action: {
                                    producto.nombre = nombre
                                    producto.descripcion = descripcion
                                    producto.precio = Float(precio)!
                                    addProduct()
                                }, label: {
                                    Text("Actualizar")
                                })
                                
                                Button(action: {
                                    deleteProduct(producto: producto)
                                    mostrarFormulario = false
                                }, label: {
                                    Text("Eliminar")
                                    Image(systemName: "trash.fill")
                                }).onAppear(perform: {
                                    nombre = producto.nombre ?? ""
                                    descripcion = producto.descripcion ?? ""
                                    precio = "\(producto.precio)"
                                })
                            }
                        }, label: {
                            Text(producto.nombre ?? "")
                        })
                    }
                } // List
                Text("Selecciona un elemento")
            }.toolbar {
                ToolbarItem {
                    Button(action: {
                        mostrarFormulario = true
                    }, label: {
                        Text("Añadir")
                        Image(systemName: "plus")
                    }) // Button Añadir
                }
            } // Toolbar
        } else {
            FormView(dbContext: viewContext, onSave: {
                addProduct()
                mostrarFormulario = false
            })
        }
    } // Body
    
    private func addProduct() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Se petatio la BD \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteProduct(producto: Producto) {
        do {
            viewContext.delete(producto)
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Se petatio la BD \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

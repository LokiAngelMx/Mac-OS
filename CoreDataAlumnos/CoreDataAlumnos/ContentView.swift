import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Alumno.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Alumno>
    
    @State private var mostrarFormulario: Bool = false
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var edad: String = ""
    
    var body: some View {
        if !mostrarFormulario {
            NavigationView {
                List {
                    ForEach(items) { alumno in
                        NavigationLink(destination: {
                            List {
                                TextField("Nombre", text: $nombre)
                                TextField("Apellido", text: $apellido)
                                TextField("Edad", text: $edad)
                                
                                Button(action: {
                                    alumno.nombre = nombre
                                    alumno.apellido = apellido
                                    alumno.edad = Int16(edad)!
                                    addAlumno()
                                }, label: {
                                    Text("Actualizar")
                                })
                                
                                Button(action: {
                                    deleteAlumno(alumno: alumno)
                                    mostrarFormulario = false
                                }, label: {
                                    Text("Eliminar")
                                    Image(systemName: "trash.fill")
                                }).onAppear(perform: {
                                    nombre = alumno.nombre ?? ""
                                    apellido = alumno.apellido ?? ""
                                    edad = "\(alumno.edad)"
                                })
                            }
                        }, label: {
                            Text(alumno.nombre ?? "")
                        })
                    }
                }
                Text("Selecciona un elemento")
            }.toolbar {
                ToolbarItem {
                    Button(action: {
                        mostrarFormulario = true
                    }, label: {
                        Text("Añadir")
                        Image(systemName: "plus")
                    })
                    Button(action: {
                        NSApp.terminate(self)
                    }, label: {
                        Text("Salir")
                    })
                }
            }
        } else {
            FormView(dbContext: viewContext, onSave: {
                addAlumno()
                mostrarFormulario = false
            }, onCancel: {
                mostrarFormulario = false
            })
        }
    }
    
    private func addAlumno() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Se petatio la BD \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteAlumno(alumno: Alumno) {
        do {
            viewContext.delete(alumno)
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

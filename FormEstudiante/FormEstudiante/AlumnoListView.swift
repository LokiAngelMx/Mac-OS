import Foundation
import SwiftUI

struct AlumnoListView: View {
    @State private var alumnoEditar: Alumno? = nil
    @State private var mostrarFormulario = false
    @State var alumnos: [Alumno] = [
        Alumno(nombre: "Juan", apellido: "Romero", edad: 19, promedioGeneral: 90.45),
        Alumno(nombre: "Luis", apellido: "Pérez", edad: 20, promedioGeneral: 89.34),
        Alumno(nombre: "Roberto", apellido: "García", edad: 21, promedioGeneral: 79.26)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Listado de alumnos").font(.headline)
                Spacer()
                Button("Agregar Alumno", action: {
                    mostrarFormulario = true
                })
            }.padding()
            
            List(alumnos, id: \.id) { alumno in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(alumno.nombre) \(alumno.apellido)")
                        Text("Edad: \(alumno.edad)")
                        Text("Promedio: \(alumno.promedioGeneral)")
                    }
                    Spacer()
                    Button("Editar", action: {
                        alumnoEditar = alumno
                        mostrarFormulario = true
                    })
                }
            }
        }.sheet(isPresented: $mostrarFormulario) {
            AlumnoFormView(alumno: $alumnoEditar) {alumnoEditado in
                if let index = alumnos.firstIndex(where: {$0.id == alumnoEditado.id}) {
                    // Editar
                    alumnos[index] = alumnoEditado
                } else {
                    // Agregar
                    alumnos.append(alumnoEditado)
                }
                mostrarFormulario = false
                alumnoEditar = nil
            }.frame(minWidth: 600)
        }
    }
}

#Preview {
    AlumnoListView()
}

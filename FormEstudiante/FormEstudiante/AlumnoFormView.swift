import Foundation
import SwiftUI

struct AlumnoFormView: View {
    @Binding var alumno: Alumno?
    var guardar: (Alumno) -> Void
    @State private var nombre: String = ""
    @State private var apellido: String = ""
    @State private var edad: String = ""
    @State private var promedioGeneral: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text(alumno == nil ? "Agregar" : "Editar").font(.largeTitle).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Apellido", text: $apellido)
                NumberOnlyTextField(titulo: "Edad", texto: $edad)
                NumberDoubleOnlyTextField(titulo: "Promedio General", texto: $promedioGeneral)
                HStack {
                    Spacer()
                    Button("Guardar", action: {
                        if let alumnoEditado = alumno {
                            alumno = Alumno(id: alumnoEditado.id, nombre: nombre, apellido: apellido, edad: Int(edad) ?? 0, promedioGeneral: Double(promedioGeneral) ?? 0)
                            guardar(alumno!)
                        } else {
                            let alumnoNuevo = Alumno(nombre: nombre, apellido: apellido, edad: Int(edad) ?? 0, promedioGeneral: Double(promedioGeneral) ?? 0)
                            guardar(alumnoNuevo)
                        }
                    }).controlSize(.extraLarge)
                }
            }.formStyle(GroupedFormStyle())
        }.onAppear() {
            if let alumnoEditado = alumno {
                self.nombre = alumnoEditado.nombre
                self.apellido = alumnoEditado.apellido
                self.edad = String(alumnoEditado.edad)
                self.promedioGeneral = String(format: "%2f", alumnoEditado.promedioGeneral)
            }
        }
    }
}

struct StudentFormView_Preview: PreviewProvider {
    static var previews: some View {
        AlumnoFormView(alumno: .constant(nil), guardar: {_ in})
    }
}

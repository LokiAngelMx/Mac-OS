import Foundation

struct Alumno {
    var id: UUID
    var nombre: String
    var apellido: String
    var edad: Int
    var promedioGeneral: Double
    
    init(id: UUID, nombre: String, apellido: String, edad: Int, promedioGeneral: Double) {
        self.id = id
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
        self.promedioGeneral = promedioGeneral
    }
    
    init(nombre: String, apellido: String, edad: Int, promedioGeneral: Double) {
        self.id = UUID()
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
        self.promedioGeneral = promedioGeneral
    }
}

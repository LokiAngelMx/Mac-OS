import Foundation

class Libro: Equatable {
    var nombre: String
    var editorial: String
    var autor: String
    var librosVendidos: Int
    
    init(nombre: String, editorial: String, autor: String, librosVendidos: Int) {
        self.nombre = nombre
        self.editorial = editorial
        self.autor = autor
        self.librosVendidos = librosVendidos
    }
    
    static func ==(lhs: Libro, rhs: Libro) -> Bool {
        return lhs.nombre == rhs.nombre &&
        lhs.editorial == rhs.editorial &&
        lhs.autor == rhs.autor &&
        lhs.librosVendidos == rhs.librosVendidos
    }
}

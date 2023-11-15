import Foundation
import SwiftUI

struct NumberOnlyTextField: View {
    var titulo = ""
    @Binding var texto: String
    
    var body: some View {
        TextField(titulo, text: $texto).onChange(of: texto) {_, newValue in
            self.texto = filtrarSoloNumeros(desde: newValue)
        }
    }
    
    func filtrarSoloNumeros(desde string: String) -> String {
        return String(string.filter {"0123456789".contains($0)})
    }
}

struct NumberDoubleOnlyTextField: View {
    var titulo = ""
    @Binding var texto: String
    
    var body: some View {
        TextField(titulo, text: $texto).onChange(of: texto) {_, newValue in
            self.texto = filtrarSoloNumerosCondicionales(desde: newValue)
        }
    }
    
    func filtrarSoloNumerosCondicionales(desde string: String) -> String {
        var filtered = String(string.filter {"0123456789.".contains($0)})
        let decimalCount = filtered.filter {$0 == "."}.count
        
        if decimalCount > 1 {
            while filtered.last == "." {
                filtered.removeLast()
            }
            filtered = filtered.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
            filtered.append(".")
        }
        return filtered
    }
}

import Foundation
import SwiftUI

struct ProductListView: View {
    @State private var productEditar: Product? = nil
    @State private var mostrarFormulario = false
    @State var products: [Product] = [
        Product(name: "Bocina", price: 300.39, quantity: 62),
        Product(name: "Laptop", price: 900.24, quantity: 75),
        Product(name: "Teclado", price: 100.87, quantity: 94)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Listado de productos").font(.headline)
                Spacer()
                Button("Agregar producto", action: {
                    mostrarFormulario = true
                })
            }.padding()
            
            List(products, id: \.id) { product in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(product.name)")
                        Text("Precio: \(product.price)")
                        Text("Cantidad: \(product.quantity)")
                    }
                    Spacer()
                    Button("Editar", action: {
                        productEditar = product
                        mostrarFormulario = true
                    })
                    Button("Eliminar") {
                        if let index = products.firstIndex(where: { $0.id == product.id }) {
                            products.remove(at: index)
                        }
                    }
                }
            }
        }.sheet(isPresented: $mostrarFormulario) {
            ProductFormView(product: $productEditar) {productEditado in
                if let index = products.firstIndex(where: {$0.id == productEditado.id}) {
                    // Editar
                    products[index] = productEditado
                } else {
                    // Agregar
                    products.append(productEditado)
                }
                mostrarFormulario = false
                productEditar = nil
            }.frame(minWidth: 600)
        }
    }
}

#Preview {
    ProductListView()
}

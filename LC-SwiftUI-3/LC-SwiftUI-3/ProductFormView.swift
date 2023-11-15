import Foundation
import SwiftUI

struct ProductFormView: View {
    @Binding var product: Product?
    var guardar: (Product) -> Void
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var quantity: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Text(product == nil ? "Agregar" : "Editar").font(.largeTitle).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            Form {
                TextField("Nombre", text: $name)
                NumberDoubleOnlyTextField(titulo: "Precio", texto: $price)
                NumberOnlyTextField(titulo: "Cantidad", texto: $quantity)
                HStack {
                    Spacer()
                    Button("Guardar", action: {
                        if let productEditado = product {
                            product = Product(id: productEditado.id, name: name, price: Double(price) ?? 0, quantity: Int(quantity) ?? 0)
                            guardar(product!)
                        } else {
                            let productNuevo = Product(name: name, price: Double(price) ?? 0, quantity: Int(quantity) ?? 0)
                            guardar(productNuevo)
                        }
                    }).controlSize(.extraLarge)
                }
            }.formStyle(GroupedFormStyle())
        }.onAppear() {
            if let productEditado = product {
                self.name = productEditado.name
                self.price = String(format: "%2f", productEditado.price)
                self.quantity = String( productEditado.quantity)
            }
        }
    }
}

struct StudentFormView_Preview: PreviewProvider {
    static var previews: some View {
        ProductFormView(product: .constant(nil), guardar: {_ in})
    }
}

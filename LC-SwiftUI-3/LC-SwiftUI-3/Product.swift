import Foundation

struct Product {
    var id: UUID
    var name: String
    var price: Double
    var quantity: Int
    
    init(id: UUID, name: String, price: Double, quantity: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    init(name: String, price: Double, quantity: Int) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

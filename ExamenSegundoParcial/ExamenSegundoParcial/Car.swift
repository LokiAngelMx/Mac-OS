import Foundation

struct Car: Codable {
    var id: String
    var marca: String
    var modelo: String
    var ano: Int
    var llantas: String
    var precio: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case marca
        case modelo
        case ano
        case llantas
        case precio
    }
    
    init(marca: String, modelo: String, ano: Int, llantas: String, precio: Double) {
        self.id = ""
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.llantas = llantas
        self.precio = precio
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.marca = try container.decode(String.self, forKey: .marca)
        self.modelo = try container.decode(String.self, forKey: .modelo)
        self.ano = try container.decode(Int.self, forKey: .ano)
        self.llantas = try container.decode(String.self, forKey: .llantas)
        
        let precio = try container.decode(String.self, forKey: .precio)
        self.precio = Double(precio) ?? 0.0
        
        //let ano = try container.decode(String.self, forKey: .ano)
        //self.ano = Int(ano) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(marca, forKey: .marca)
        try container.encode(modelo, forKey: .modelo)
        try container.encode(ano, forKey: .ano)
        try container.encode(llantas, forKey: .llantas)
        try container.encode(String(precio), forKey: .precio)
        
        if !id.isEmpty {
            try container.encode(id, forKey: .id)
        }
    }
}

import Foundation

/*
 let numero: number / .toString()
 */

struct Product: Codable {
    var id: String
    var name: String
    var description: String
    var price: Double
    var createdAt: Date
    
    enum CodingKeys: String,  CodingKey {
        case id
        case name
        case price
        case description
        case createdAt // = "created_at" // created_at
    }
    
    init(name: String, description: String, price: Double) {
        self.id = ""
        self.name = name
        self.description = description
        self.price = price
        self.createdAt = Date()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        
        let price = try container.decode(String.self, forKey: .price)
        self.price = Double(price) ?? 0.0
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(String(price), forKey: .price)
        
        if !id.isEmpty {
            try container.encode(id, forKey: .id)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        let formattedDate = formatter.string(from: createdAt)
        try container.encode(formattedDate, forKey: .createdAt)
    }
}

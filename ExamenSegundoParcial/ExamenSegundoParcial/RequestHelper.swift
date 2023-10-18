import Foundation

class RequestHelper <T: Codable> {
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func get(endpoint: String, completion: @escaping(Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endpoint)
        URLSession.shared.dataTask(with: url) {
            data, _, error in
            self.handleResponse(data: data, error: error, completion: completion)
        }.resume()
    }
    
    func post(endpoint: String, object: T, completion: @escaping(Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(object)
        } catch {
            completion(.failure(error))
        }
        
        URLSession.shared.dataTask(with: request) {
            data, _, error in
            self.handleResponse(data: data, error: error, completion: completion)
        }.resume()
    }
    
    func patch(endpoint: String, object: T, completion: @escaping(Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(object)
        } catch {
            completion(.failure(error))
        }
        
        URLSession.shared.dataTask(with: request) {
            data, _, error in
            self.handleResponse(data: data, error: error, completion: completion)
        }.resume()
    }
    
    private func handleResponse(data: Data?, error: Error?, completion: @escaping (Result<T, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }
        let decoder = JSONDecoder()
        
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(error))
        }
    }
}

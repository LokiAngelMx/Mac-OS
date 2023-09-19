import Cocoa

class ViewController: NSViewController {
    
    func saludar() {
        print("Hola")
    }
    func saludarConParametros(nombre: String) {
        print ("Hola \(nombre)")
    }
    
    func obtenerSaludo(nombre: String, apellido: String) -> String {
        return "Hola \(nombre) \(apellido)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

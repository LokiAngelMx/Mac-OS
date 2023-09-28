import Cocoa

class AgregarLibroViewController: NSViewController {
    
    @IBOutlet var txtNombre: NSTextField!
    @IBOutlet var txtAutor: NSTextField!
    @IBOutlet var txtEditorial: NSTextField!
    @IBOutlet var txtLibrosVendidos: NSTextField!
    
    var dataHandler: ((Libro) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickBoton(_ sender: NSButton) {
        switch(sender.identifier) {
        case NSUserInterfaceItemIdentifier("btnAgregar"):
            let nuevoLibro = obtenerLibro()
            dataHandler?(nuevoLibro)
            self.view.window?.close()
            break
        case NSUserInterfaceItemIdentifier("btnCancelar"):
            self.view.window?.close()
            break
        default:
            return
        }
    }
    
    func obtenerLibro() -> Libro {
        let nombre = txtNombre.stringValue
        let autor = txtAutor.stringValue
        let editorial = txtEditorial.stringValue
        let librosVendidos = txtLibrosVendidos.integerValue
        let libro = Libro(nombre: nombre, editorial: editorial, autor: autor, librosVendidos: librosVendidos)
        return libro
    }
}

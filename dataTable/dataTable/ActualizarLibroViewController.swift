import Cocoa

class ActualizarLibroViewController: NSViewController {
    var libroAActualizar: Libro?
    var updateHandler: ((Libro, Libro) -> Void)?
    
    @IBOutlet var txtNombre: NSTextField!
    @IBOutlet var txtAutor: NSTextField!
    @IBOutlet var txtEditorial: NSTextField!
    @IBOutlet var txtLibrosVendidos: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let libro = libroAActualizar {
            txtNombre.stringValue = libro.nombre
            txtAutor.stringValue = libro.autor
            txtEditorial.stringValue = libro.editorial
            txtLibrosVendidos.integerValue = libro.librosVendidos
        }
    }
    
    @IBAction func onClickBoton(_ sender: NSButton) {
        switch(sender.identifier) {
        case NSUserInterfaceItemIdentifier("btnActualizar"):
            let nuevoLibro = obtenerLibro()
            if let libroOriginal = libroAActualizar {
                updateHandler?(libroOriginal, nuevoLibro)
            }
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
        return Libro(nombre: nombre, editorial: editorial, autor: autor, librosVendidos: librosVendidos)
    }
}

import Cocoa

class EliminarLibroViewController: NSViewController {
    var libroAEliminar: Libro?
    var removeHandler: ((Libro) -> Void)?
    
    @IBOutlet var txtNombre: NSTextField!
    @IBOutlet var txtAutor: NSTextField!
    @IBOutlet var txtEditorial: NSTextField!
    @IBOutlet var txtLibrosVendidos: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let libro = libroAEliminar {
            txtNombre.stringValue = libro.nombre
            txtAutor.stringValue = libro.autor
            txtEditorial.stringValue = libro.editorial
            txtLibrosVendidos.integerValue = libro.librosVendidos
        }
    }
    
    @IBAction func onClickBoton(_ sender: NSButton) {
        switch(sender.identifier) {
        case NSUserInterfaceItemIdentifier("btnEliminar"):
            if let libro = libroAEliminar {
                removeHandler?(libro)
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
}

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var txtContraseña: NSSecureTextField!
    
    @IBOutlet var txtUsuario: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func onIniciarSesion(_ sender: NSButton) {
        switch(sender.identifier) {
        case NSUserInterfaceItemIdentifier("btnIniciarSesion"):
            let nombreUsuario = self.txtUsuario.stringValue
            
            if let modalTablaLibro = self.storyboard?.instantiateController(withIdentifier: "tablaLibroView") as? TablaLibroViewController {
                modalTablaLibro.nombreUsuario = nombreUsuario
                //modalTablaLibro.lbUsuario.stringValue = nombreUsuario
                
                print("El nombre de usuario es: \(nombreUsuario)")
                
                self.presentAsModalWindow(modalTablaLibro)
            }
            break
        default:
            return
        }
    }
}

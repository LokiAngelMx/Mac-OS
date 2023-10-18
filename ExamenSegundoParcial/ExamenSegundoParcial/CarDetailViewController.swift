import Cocoa

class CarDetailViewController: NSViewController {

    @IBOutlet var lbTitle: NSTextField!
    @IBOutlet var txtId: NSTextField!
    @IBOutlet var txtMarca: NSTextField!
    @IBOutlet var txtModelo: NSTextField!
    @IBOutlet var txtAno: NSTextField!
    @IBOutlet var txtLlantas: NSTextField!
    @IBOutlet var txtPrecio: NSTextField!
    
    var dataHandler: ((Car) -> Void)?
    
    @IBAction func onSave(_ sender: NSButton) {
        self.dataHandler?(getCar())
        self.view.window?.close()
    }
    
    @IBAction func onBack(_ sender: NSButton) {
        self.view.window?.close()
    }
    
    func getCar() -> Car {
        let car = Car(marca: txtMarca.stringValue, modelo: txtModelo.stringValue, ano: txtAno.integerValue, llantas: txtLlantas.stringValue, precio: txtPrecio.doubleValue)
        return car
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

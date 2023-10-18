import Cocoa

class ProductDetailViewController: NSViewController {
    
    @IBOutlet var lbTitle: NSTextField!
    @IBOutlet var txtId: NSTextField!
    @IBOutlet var txtName: NSTextField!
    @IBOutlet var txtDescripcion: NSTextField!
    @IBOutlet var txtPrecio: NSTextField!
    @IBOutlet var lbDate: NSTextField!
    
    var dataHandler: ((Product) -> Void)?
    
    @IBAction func onSave(_ sender: NSButton) {
        self.dataHandler?(getProduct())
        self.view.window?.close()
    }
    
    @IBAction func onBack(_ sender: NSButton) {
        self.view.window?.close()
    }

    func getProduct() -> Product {
        let product = Product(name: txtName.stringValue, description: txtDescripcion.stringValue, price: txtPrecio.doubleValue)
        return product
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

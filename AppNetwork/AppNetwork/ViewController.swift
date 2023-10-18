import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var btnEditar: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        btnEditar.isHidden = true
        loadData()
    }
    
    func loadData() {
        let baseURL = URL(string:"https://651c5a5b194f77f2a5afbd20.mockapi.io/")!
        let requestHelper = RequestHelper<[Product]>(baseURL: baseURL)
        requestHelper.get(endpoint: "products", completion: {
            result in switch result {
            case .success(let products):
                print("Productos", products)
                productData = products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error", error)
            }
        })
    }

    @IBAction func onAdd(_ sender: NSButton) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "detailView") as? ProductDetailViewController {
            modalSheet.dataHandler = {
                data in
                print(data)
                let baseURL = URL(string:"https://651c5a5b194f77f2a5afbd20.mockapi.io/")!
                let requestHelper = RequestHelper<Product>(baseURL: baseURL)
                requestHelper.post(endpoint: "products", object: data, completion: {
                    result in
                    switch result {
                    case .success(let product):
                        DispatchQueue.main.async {
                            productData.append(product)
                            self.tableView.reloadData()
                        }
                    case .failure(let error):
                        print("Error en el post", error)
                    }
                })
            }
            self.presentAsSheet(modalSheet)
            modalSheet.lbTitle.stringValue = "Agregar producto"
            modalSheet.lbDate.stringValue = ""
            modalSheet.txtId.isEditable = false
            tableView.deselectAll(self)
        }
    }
    
    @IBAction func onEdit(_ sender: NSButton) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "detailView") as? ProductDetailViewController {
            if (tableView.selectedRow == -1) {
                return
            }
            
            let selectedProduct = productData[tableView.selectedRow]
            
            modalSheet.dataHandler = {
                data in
                print(data)
                let baseURL = URL(string:"https://651c5a5b194f77f2a5afbd20.mockapi.io/")!
                let requestHelper = RequestHelper<Product>(baseURL: baseURL)
                requestHelper.patch(endpoint: "products/\(selectedProduct.id)", object: data, completion: {
                    result in
                    switch result {
                    case .success(let product):
                        print(product)
                        DispatchQueue.main.async {
                            self.loadData()
                            self.tableView.reloadData()
                        }
                    case .failure(let error):
                        print("Error en el patch", error)
                    }
                })
            }
            
            self.presentAsSheet(modalSheet)
            modalSheet.lbTitle.stringValue = "Agregar producto"
            modalSheet.lbDate.stringValue = selectedProduct.createdAt.ISO8601Format()
            modalSheet.txtId.isEditable = false
            modalSheet.txtId.stringValue = selectedProduct.id
            modalSheet.txtName.stringValue = selectedProduct.name
            modalSheet.txtDescripcion.stringValue = selectedProduct.description
            modalSheet.txtPrecio.doubleValue = selectedProduct.price
            tableView.deselectAll(self)
        }
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let item = productData[row]
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colId") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celId")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.id
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colName") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celName")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.name
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colDescripcion") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celDescripcion")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.description
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colPrecio") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celPrecio")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.doubleValue = item.price
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colFecha") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celFecha")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.createdAt.ISO8601Format()
            return celView
        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if (tableView.selectedRow == -1) {
            btnEditar.isHidden = true
        } else {
            let selectedProduct = productData[tableView.selectedRow]
            btnEditar.isHidden = false
            btnEditar.title = "Editar ID: \(selectedProduct.id)"
        }
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return productData.count
    }
}

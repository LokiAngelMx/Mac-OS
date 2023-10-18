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
        let requestHelper = RequestHelper<[Car]>(baseURL: baseURL)
        requestHelper.get(endpoint: "cars", completion: {
            result in switch result {
            case .success(let cars):
                print("Carros", cars)
                carData = cars
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error", error)
            }
        })
    }
    
    @IBAction func onAdd(_ sender: NSButton) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "detailView") as? CarDetailViewController {
            modalSheet.dataHandler = {
                data in
                print(data)
                let baseURL = URL(string:"https://651c5a5b194f77f2a5afbd20.mockapi.io/")!
                let requestHelper = RequestHelper<Car>(baseURL: baseURL)
                requestHelper.post(endpoint: "cars", object: data, completion: {
                    result in
                    switch result {
                    case .success(let car):
                        DispatchQueue.main.async {
                            carData.append(car)
                            self.tableView.reloadData()
                        }
                    case .failure(let error):
                        print("Error en el post", error)
                    }
                })
            }
            self.presentAsSheet(modalSheet)
            modalSheet.lbTitle.stringValue = "Agregar carro"
            modalSheet.txtId.isEditable = false
            tableView.deselectAll(self)
        }
    }
    
    @IBAction func onEdit(_ sender: NSButton) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "detailView") as? CarDetailViewController {
            if (tableView.selectedRow == -1) {
                return
            }
            
            let selectedCar = carData[tableView.selectedRow]
            
            modalSheet.dataHandler = {
                data in
                print(data)
                let baseURL = URL(string:"https://651c5a5b194f77f2a5afbd20.mockapi.io/")!
                let requestHelper = RequestHelper<Car>(baseURL: baseURL)
                requestHelper.patch(endpoint: "cars/\(selectedCar.id)", object: data, completion: {
                    result in
                    switch result {
                    case .success(let car):
                        print(car)
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
            modalSheet.lbTitle.stringValue = "Agregar carro"
            modalSheet.txtId.isEditable = false
            modalSheet.txtId.stringValue = selectedCar.id
            modalSheet.txtMarca.stringValue = selectedCar.marca
            modalSheet.txtModelo.stringValue = selectedCar.modelo
            modalSheet.txtAno.integerValue = selectedCar.ano
            modalSheet.txtLlantas.stringValue = selectedCar.llantas
            modalSheet.txtPrecio.doubleValue = selectedCar.precio
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
        let item = carData[row]
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colId") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celId")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.id
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colMarca") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celMarca")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.marca
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colModelo") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celModelo")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.modelo
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colAno") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celAno")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.integerValue = item.ano
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colLlantas") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celLlantas")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.stringValue = item.llantas
            return celView
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier("colPrecio") {
            let cellIdentifier = NSUserInterfaceItemIdentifier("celPrecio")
            
            guard let celView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
                return nil
            }
            celView.textField?.doubleValue = item.precio
            return celView
        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if (tableView.selectedRow == -1) {
            btnEditar.isHidden = true
        } else {
            let selectedCar = carData[tableView.selectedRow]
            btnEditar.isHidden = false
            btnEditar.title = "Editar ID: \(selectedCar.id)"
        }
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return carData.count
    }
}

import Cocoa

class TablaLibroViewController: NSViewController {
    var libros: [Libro] = []
    var nombreUsuario: String?
    
    @IBOutlet var tableView: NSTableView!
    @IBOutlet var lbUsuario: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.lbUsuario.stringValue = "Hola \(self.nombreUsuario!), bienvenido"
        
        let libro1 = Libro(nombre: "Titulo", editorial: "Editorial", autor: "Angel", librosVendidos: 554)
        
        let libro2 = Libro(nombre: "Otro libro", editorial: "Otra editorial", autor: "Otro autor", librosVendidos: 921)
        
        libros.append(libro1)
        libros.append(libro2)
    }
    
    @IBAction func onAgregar(_ sender: NSButton) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "agregarLibroView") as? AgregarLibroViewController {
            modalSheet.dataHandler = { (data) in
                self.libros.append(data)
                self.tableView.reloadData()
            }
            self.presentAsSheet(modalSheet)
        }
    }
    
    @IBAction func onEliminar(_ sender: NSButton) {
        if tableView.selectedRow != -1 {
            if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "eliminarLibroView") as? EliminarLibroViewController {
                let libroSeleccionado = libros[tableView.selectedRow]
                modalSheet.libroAEliminar = libroSeleccionado
                modalSheet.removeHandler = { libro in
                    if let index = self.libros.firstIndex(of: libro) {
                        self.libros.remove(at: index)
                        self.tableView.reloadData()
                    }
                }
                self.presentAsSheet(modalSheet)
            }
        }
    }
    
    @IBAction func onActualizar(_ sender: NSButton) {
        if tableView.selectedRow != -1 {
            if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "actualizarLibroView") as? ActualizarLibroViewController {
                let libroSeleccionado = libros[tableView.selectedRow]
                modalSheet.libroAActualizar = libroSeleccionado
                modalSheet.updateHandler = { libroOriginal, libroActualizado in
                    if let index = self.libros.firstIndex(of: libroOriginal) {
                        self.libros[index] = libroActualizado
                        self.tableView.reloadData()
                    }
                }
                self.presentAsSheet(modalSheet)
            }
        }
    }
}

extension TablaLibroViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("El elemento seleccionado es: \(tableView.selectedRow)")
        if tableView.selectedRow == -1 {
            return
        }
        let libroSeleccionado = libros[tableView.selectedRow]
        print("El libro seleccionado es: \(libroSeleccionado.nombre)")
    }
    
    // Llena los datos de la tabla
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let libro = libros [row]
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "colNombre") {
            let identificadorDeCelda = NSUserInterfaceItemIdentifier(rawValue: "celNombre")
            guard let vistaCelda = tableView.makeView(withIdentifier: identificadorDeCelda, owner: self) as? NSTableCellView else {
                return nil
            }
            vistaCelda.textField?.stringValue = libro.nombre
            return vistaCelda
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "colEditorial") {
            let identificadorDeCelda = NSUserInterfaceItemIdentifier(rawValue: "celEditorial")
            guard let vistaCelda = tableView.makeView(withIdentifier: identificadorDeCelda, owner: self) as? NSTableCellView else {
                return nil
            }
            vistaCelda.textField?.stringValue = libro.editorial
            return vistaCelda
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "colAutor") {
            let identificadorDeCelda = NSUserInterfaceItemIdentifier(rawValue: "celAutor")
            guard let vistaCelda = tableView.makeView(withIdentifier: identificadorDeCelda, owner: self) as? NSTableCellView else {
                return nil
            }
            vistaCelda.textField?.stringValue = libro.autor
            return vistaCelda
        }
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "colLibrosVendidos") {
            let identificadorDeCelda = NSUserInterfaceItemIdentifier(rawValue: "celLibrosVendidos")
            guard let vistaCelda = tableView.makeView(withIdentifier: identificadorDeCelda, owner: self) as? NSTableCellView else {
                return nil
            }
            vistaCelda.textField?.integerValue = libro.librosVendidos
            return vistaCelda
        }
        return nil
    }
}

extension TablaLibroViewController: NSTableViewDataSource {
    // Obtiene el numero de elementos en el datasource - libros (arreglo)
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.libros.count
    }
}

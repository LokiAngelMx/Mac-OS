import Cocoa

class SheetPasswordController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePassword(_ sender: Any) {
        self.view.window?.close()
    }
}

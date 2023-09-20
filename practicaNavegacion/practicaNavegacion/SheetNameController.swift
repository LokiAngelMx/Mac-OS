import Cocoa

class SheetNameController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeName(_ sender: Any) {
        self.view.window?.close()
    }
}

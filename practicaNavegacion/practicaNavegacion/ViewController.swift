import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToMain(_ sender: Any) {
        let mainWindowController = storyboard?.instantiateController(withIdentifier: "mainWindow") as? NSWindowController
        
        mainWindowController?.showWindow(mainWindowController)
        
        self.view.window?.close()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

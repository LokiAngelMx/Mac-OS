import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToDashboard(_ sender: Any) {
        let dashboardWindowController = storyboard?.instantiateController(withIdentifier: "dashboardWindow") as? NSWindowController
        
        dashboardWindowController?.showWindow(dashboardWindowController)
        
        self.view.window?.close()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

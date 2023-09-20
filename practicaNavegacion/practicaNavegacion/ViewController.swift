import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRecovery()
    }
    
    @IBAction func goToMain(_ sender: Any) {
        let mainWindowController = storyboard?.instantiateController(withIdentifier: "mainWindow") as? NSWindowController
        
        mainWindowController?.showWindow(mainWindowController)
        
        self.view.window?.close()
    }
    
    
    @IBOutlet var lblRecovery: NSTextField!
    
    func btnRecovery() {
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector (clickOnButton))
        lblRecovery.addGestureRecognizer(clickGesture)
    }
    
    @objc func clickOnButton(recognizer: NSClickGestureRecognizer) {
        if let modalViewMail = self.storyboard?.instantiateController(withIdentifier: "modalViewMail") as? ModalMailController {
            self.presentAsModalWindow(modalViewMail)
        }
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
}

import Cocoa

class SheetNameController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        btnCancelName()
    }
    
    @IBAction func closeName(_ sender: Any) {
        self.view.window?.close()
    }
    
    @IBOutlet var cancelName: NSTextField!
    
    func btnCancelName() {
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector (clickOnButton))
        cancelName.addGestureRecognizer(clickGesture)
    }
    
    @objc func clickOnButton(recognizer: NSClickGestureRecognizer) {
        self.view.window?.close()
    }
}

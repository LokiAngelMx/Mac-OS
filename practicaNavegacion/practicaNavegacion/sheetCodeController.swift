import Cocoa

class sheetCodeController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        btnCancelCode()
    }
    
    @IBAction func sentCode(_ sender: Any) {
        if let modalSheetPassword = self.storyboard?.instantiateController(withIdentifier: "sheetViewPassword") as? SheetPasswordController {
            self.presentAsSheet(modalSheetPassword)
        }
    }
    
    @IBOutlet var closeCode: NSTextField!
    
    func btnCancelCode() {
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector (clickOnButton))
        closeCode.addGestureRecognizer(clickGesture)
    }
    
    @objc func clickOnButton(recognizer: NSClickGestureRecognizer) {
        self.view.window?.close()
    }
}

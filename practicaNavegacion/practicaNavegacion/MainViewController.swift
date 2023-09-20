import Cocoa

class MainViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        btnCloseSesion()
    }
    
    @IBAction func changeName(_ sender: Any) {
        if let modalSheetName = self.storyboard?.instantiateController(withIdentifier: "sheetViewName") as? SheetNameController {
            self.presentAsSheet(modalSheetName)
        }
    }
    
    @IBOutlet var closeSesion: NSTextField!
    
    func btnCloseSesion() {
        let clickGesture = NSClickGestureRecognizer(target: self, action: #selector (clickOnButton))
        closeSesion.addGestureRecognizer(clickGesture)
    }
    
    @objc func clickOnButton(recognizer: NSClickGestureRecognizer) {
        let mainWindowController = storyboard?.instantiateController(withIdentifier: "windowController") as? NSWindowController
        
        mainWindowController?.showWindow(mainWindowController)
        
        self.view.window?.close()
    }
}

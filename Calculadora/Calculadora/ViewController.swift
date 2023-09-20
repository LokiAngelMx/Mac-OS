import Cocoa

class ViewController: NSViewController {
    @IBOutlet var labelResult: NSTextField!
    @IBOutlet var button9: NSBox!
    @IBOutlet var button8: NSBox!
    @IBOutlet var button7: NSBox!
    @IBOutlet var button6: NSBox!
    @IBOutlet var button5: NSBox!
    @IBOutlet var button4: NSBox!
    @IBOutlet var button3: NSBox!
    @IBOutlet var button2: NSBox!
    @IBOutlet var button1: NSBox!
    @IBOutlet var button0: NSBox!
    @IBOutlet var buttonAdd: NSBox!
    @IBOutlet var buttonSub: NSBox!
    @IBOutlet var buttonMul: NSBox!
    @IBOutlet var buttonDiv: NSBox!
    @IBOutlet var buttonResult: NSBox!
    
    var buttons: [NSBox] = []
    var textToPrint: String = ""
    var firstOperand: Float = 0.0
    var currentOperation: Operation?
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonResult, buttonAdd, buttonSub, buttonMul, buttonDiv]
        initButtons()
    }
    
    func initButtons() {
        for button in buttons {
            let clickGesture = NSClickGestureRecognizer(target: self, action: #selector (clickOnButton))
            button.addGestureRecognizer(clickGesture)
        }
    }
    
    @objc func clickOnButton(recognizer: NSClickGestureRecognizer) {
        if let clickedButton = recognizer.view as? NSBox {
            switch clickedButton.identifier! {
            case NSUserInterfaceItemIdentifier("button0"):
                addToLabel(str: "0")
            case NSUserInterfaceItemIdentifier("button1"):
                addToLabel(str: "1")
            case NSUserInterfaceItemIdentifier("button2"):
                addToLabel(str: "2")
            case NSUserInterfaceItemIdentifier("button3"):
                addToLabel(str: "3")
            case NSUserInterfaceItemIdentifier("button4"):
                addToLabel(str: "4")
            case NSUserInterfaceItemIdentifier("button5"):
                addToLabel(str: "5")
            case NSUserInterfaceItemIdentifier("button6"):
                addToLabel(str: "6")
            case NSUserInterfaceItemIdentifier("button7"):
                addToLabel(str: "7")
            case NSUserInterfaceItemIdentifier("button8"):
                addToLabel(str: "8")
            case NSUserInterfaceItemIdentifier("button9"):
                addToLabel(str: "9")
            case NSUserInterfaceItemIdentifier("buttonAdd"):
                selectOperation(.add)
            case NSUserInterfaceItemIdentifier("buttonSub"):
                selectOperation(.subtract)
            case NSUserInterfaceItemIdentifier("buttonMul"):
                selectOperation(.multiply)
            case NSUserInterfaceItemIdentifier("buttonDiv"):
                selectOperation(.divide)
            case NSUserInterfaceItemIdentifier("buttonResult"):
                calculateResult()
            default:
                print("No existe el identificador")
            }
            
            if clickedButtonShouldNavigate(clickedButton) {
                navigateToNewViewController()
            }
        }
    }
    
    func clickedButtonShouldNavigate(_ button: NSBox) -> Bool {
            // Aquí puedes poner la lógica para decidir si un botón debe llevar a una nueva pantalla o no.
            // Por ejemplo, si un botón tiene una cierta etiqueta o clase, podrías decidir que debe llevar a una nueva pantalla.
            return button.identifier == NSUserInterfaceItemIdentifier("buttonResult")
        }
    
    func navigateToNewViewController() {
            let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
            if let newViewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("NewViewController")) as? NewViewController {
                self.presentAsSheet(newViewController)
            }
        }
    
    func selectOperation(_ operation: Operation) {
        currentOperation = operation
        firstOperand = Float(textToPrint)!
        textToPrint = ""
        addToLabel(str: "")
    }
    
    func addToLabel(str: String) {
        textToPrint = textToPrint + str
        labelResult.stringValue = textToPrint
    }
    
    func calculateResult() {
        guard let operation = currentOperation, let secondVal = Float(textToPrint) else {
            return
        }
        var value: Float = 0
        
        switch operation {
        case .add:
            value = self.firstOperand + secondVal
        case .subtract:
            value = self.firstOperand - secondVal
        case .multiply:
            value = self.firstOperand * secondVal
        case .divide:
            if secondVal == 0 {
                labelResult.stringValue = "Error"
                return
            }
            value = self.firstOperand / secondVal
        }
        labelResult.stringValue = "\(value)"
        textToPrint = String(value)
        firstOperand = 0
        currentOperation = nil
    }

    override var representedObject: Any? {
        didSet {
            
        }
    }
}

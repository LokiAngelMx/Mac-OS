import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet var label1: NSTextField!
    @IBOutlet var label2: NSTextField!
    @IBOutlet var label3: NSTextField!
    @IBOutlet var label4: NSTextField!
    @IBOutlet var label5: NSTextField!
    @IBOutlet var label6: NSTextField!
    @IBOutlet var label7: NSTextField!
    @IBOutlet var label8: NSTextField!
    @IBOutlet var label9: NSTextField!
    @IBOutlet var lblPlayer: NSTextField!
    @IBAction func btnRestart(_ sender: NSButton) {
        newGame()
        initFields()
    }
    
    
    enum GameStatus {
        case play, tie, win
    }
    
    var fields: [NSTextField] = []
    var player: Int = 0;
    var gameStatus: GameStatus = .play;
    var playerWinner: Int = 0;
    var board: [Int] = []
    
    func newGame() {
        player = 1;
        gameStatus = .play;
        playerWinner = 0;
        board = [0, 0, 0,
                 0, 0, 0,
                 0, 0, 0]
        
        setPlayer()
    }
    
    func initFields() {
        for field in fields {
            field.stringValue = ""
            field.drawsBackground = true
            field.backgroundColor = NSColor.lightGray
            field.wantsLayer = true
            field.layer?.cornerRadius = 5.0
            field.layer?.masksToBounds = true
            let clickGesture = NSClickGestureRecognizer(target: self, action: #selector(textFieldClicked))
            field.addGestureRecognizer(clickGesture)
        }
    }
    
    @objc func textFieldClicked(recognizer: NSClickGestureRecognizer) {
        print("Click en un label o textfield")
        if gameStatus != .play {
            return
        }
        
        if let clickedTextField = recognizer.view as? NSTextField {
            switch clickedTextField.identifier! {
            case NSUserInterfaceItemIdentifier("label1"):
                setValueForFieldIndex(fieldIndex: 0, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label2"):
                setValueForFieldIndex(fieldIndex: 1, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label3"):
                setValueForFieldIndex(fieldIndex: 2, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label4"):
                setValueForFieldIndex(fieldIndex: 3, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label5"):
                setValueForFieldIndex(fieldIndex: 4, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label6"):
                setValueForFieldIndex(fieldIndex: 5, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label7"):
                setValueForFieldIndex(fieldIndex: 6, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label8"):
                setValueForFieldIndex(fieldIndex: 7, value: getValueForActualPlayer())
            case NSUserInterfaceItemIdentifier("label9"):
                setValueForFieldIndex(fieldIndex: 8, value: getValueForActualPlayer())
            default:
                print("Click en otro label")
            }
        }
    }
    
    func getValueForActualPlayer () -> String {
        setPlayer()
        return self.player == 1 ? "X" : "O"
    }
    
    func setPlayer () {
        return self.lblPlayer.stringValue = "Turno del jugador \(player)"
    }
    
    func selectCell (index: Int) {
        if board [index] != 0 {
            return
        }
        
        board [index] = player
        player = player == 1 ? 2 : 1
        setPlayer()
        checkGameStatus()
    }
    
    func setValueForFieldIndex (fieldIndex: Int, value: String) {
        if board[fieldIndex] != 0 {
                return
        }
        
        fields[fieldIndex].stringValue = value
        fields[fieldIndex].drawsBackground = false
        selectCell(index: fieldIndex)
    }
    
    func checkGameStatus() {
        checkRows()
        checkColumns()
        checkDiagonals()
        checkTie()
    }
    
    func checkRows() {
        for i in stride(from: 0, to: 9, by: 3) {
            if board[i] != 0, board[i] == board[i+1], board[i+1] == board[i+2] {
                setWinner(player: board[i])
                return
            }
        }
    }
    
    func checkColumns() {
        for i in 0..<3 {
            if board[i] != 0, board[i] == board[i+3], board[i+3] == board[i+6] {
                setWinner(player: board[i])
                return
            }
        }
    }
    
    func checkDiagonals() {
        if board[0] != 0, board[0] == board[4], board[4] == board[8] {
            setWinner(player: board[0])
            return
        }
        
        if board[2] != 0, board[2] == board[4], board[4] == board[6] {
            setWinner(player: board[2])
            return
        }
    }
    
    func checkTie() {
        if !board.contains(0), gameStatus != .win {
            setTie()
        }
    }
    
    func setTie() {
        gameStatus = .tie
        showAlert(title: "Nadie ganó", message: "Es un empate", alertStyle: .warning)
    }
    
    func setWinner(player: Int) {
        gameStatus = .win
        playerWinner = player
        showAlert(title: "Ganador", message: "El jugador \(player) ganó")
    }
    
    func showAlert(title: String, message: String, alertStyle: NSAlert.Style = .informational) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.alertStyle = alertStyle
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fields = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        initFields()
        newGame()
    }

    override var representedObject: Any? {
        didSet {
            
        }
    }
}

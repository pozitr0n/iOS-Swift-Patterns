//
//  ViewController.swift
//  Command
//
//  Created by Raman Kozar on 09/11/2023.
//

import UIKit

protocol BaseCommand {
    func undo() -> String
    func forward(_ str: String)
}

class StringUndoCommand: BaseCommand {
    
    private var originalString: String
    private var currentString: String
    
    init(argument: String) {
        self.originalString = argument
        self.currentString = argument
    }
    
    func undo() -> String {
        currentString.removeLast()
        printString()
        return currentString
    }
    
    func forward(_ str: String) {
        currentString.append(str)
        printString()
    }
    
    func printString() {
        print(currentString)
    }
    
}

class CommandExecutor {
    
    private var arrayOfCommand = [BaseCommand]()
    
    func addCommand(command: BaseCommand) {
        arrayOfCommand.append(command)
    }
    
    func forward(_ str: String) {
        for command in arrayOfCommand {
            command.forward(str)
        }
    }
    
    func undoLast() -> String {
        
        var title = String()
        
        for command in arrayOfCommand {
            title = command.undo()
        }
        
        return title
        
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let commandExecutor = CommandExecutor()
    var cmdUndo: StringUndoCommand?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self

    }

    @IBAction func undoAction(_ sender: Any) {
        textField.text = commandExecutor.undoLast()
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        guard let textFieldText = textField.text else { return false }
        
        cmdUndo = StringUndoCommand(argument: textFieldText)
        guard let cmdUndo = cmdUndo else { return false }
        
        commandExecutor.addCommand(command: cmdUndo)
        commandExecutor.forward(string)
        
        return true
        
    }
    
}

//
//  ViewController.swift
//  SimpleGUI
//
//  Created by Carlos Diaz on 17/11/2019.
//  Copyright © 2019 woowrale. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let alert = NSAlert()

    @IBOutlet weak var textName: NSTextField!
    @IBOutlet weak var textAddress: NSTextField!
    @IBOutlet weak var textPhone: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func doSayHelloWorld(_ sender: NSButton) {
        print("Hola Mundo MacOS")
        var person = Person()
        person.name = textName.stringValue
        person.address = textAddress.stringValue
        person.phone = textPhone.stringValue
        
        alert.messageText = person.name + "\r\n" + person.address + "\r\n" + person.phone
        alert.runModal()
        
    }
    
    struct Person {
        var name: String = ""
        var address: String = ""
        var phone: String = ""

    }
}




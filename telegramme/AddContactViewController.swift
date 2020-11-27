//
//  AddContactViewController.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 14/11/20.
//

import Foundation
import UIKit

class AddContactViewController : UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    var contactController = ContactController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
        //create guy
        let contact = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
        //appDelegate.contactList.append(contact)
        
        contactController.AddContact(newContact: contact)
        
        
        
        //checks if a new guy has been added
        print(String(appDelegate.contactList.count))
        
    }
    
}

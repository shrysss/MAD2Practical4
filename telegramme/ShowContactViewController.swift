//
//  ShowContactViewController.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 14/11/20.
//

import Foundation
import UIKit

class ShowContactViewController : UITableViewController {
    
    //Alternative Method
    //var contact:Contact?
    var contactController = ContactController()
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        
        
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
            if editingStyle == UITableViewCell.EditingStyle.delete {
                
                
                appDelegate.contactList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let edit = segue.destination as? Edit,
                let index = tableView.indexPathForSelectedRow?.row
            else{
                return
            }
            edit.contact = appDelegate.contactList[index]
        }
}

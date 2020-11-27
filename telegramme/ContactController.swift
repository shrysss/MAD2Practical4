//
//  ContactController.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 26/11/20.
//

import Foundation
import UIKit
import CoreData

class ContactController{
    
    func AddContact(newContact:Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        
        contact.setValue(newContact.firstName, forKey: "firstname")
        contact.setValue(newContact.lastName, forKey: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do{
            try appDelegate.saveContext()
        }catch let error as NSError{
            print("Could not save")
        }
        
        
    }

    func retrieveAllContact() -> [Contact]
    {
        var contacts:[NSManagedObject] = []
        var nc:[Contact] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contacts = try context.fetch(fetchRequest)
            for p in contacts{
                let firstname = p.value(forKey: "firstname") as? String
                let lastname = p.value(forKey: "lastname") as? String
                let mobileno = p.value(forKey: "mobileno") as? String
                print("\(firstname!) \(lastname!), \(mobileno!)")
                nc = [Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!)]
                return nc
                
            
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        appDelegate.saveContext()
        return nc
    }
}
//    func updateContact(mobileno:String, newContact:Contact)
//    
//
//    }
//
//    func deleteContact(mobileno:String)
//    {}


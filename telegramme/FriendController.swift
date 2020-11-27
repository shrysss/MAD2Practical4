//
//  FriendController.swift
//  telegramme
//
//  Created by Shane-Rhys Chua on 27/11/20.
//

import Foundation
import UIKit
import CoreData

func AddFriend(newfriend:CDFriend) {
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
    
    let friend = NSManagedObject(entity: entity, insertInto: context)
    
    friend.setValue(newfriend.name, forKey: "name")
    friend.setValue(newfriend.profileImageName, forKey: "profileImageName")
    
    do{
        try appDelegate.saveContext()
    }catch let error as NSError{
        print("Could not save")
    }
    
}

func AddMessageToFriend(newfriend:CDFriend, newmessage:CDMessage){
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
    
    let friend = NSManagedObject(entity: entity, insertInto: context)
    
    friend.setValue(friend.value(forKey: "lastmessage"), forKey: "messages")
    friend.setValue(newmessage, forKey: "lastMessage")
    
    do{
        try appDelegate.saveContext()
    }catch let error as NSError{
        print("Could not save")
    }
}
//
//func retrieveMessagesbyFriend(friend:CDFriend) -> [CDMessage] {
//    return [null
//}

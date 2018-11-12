//
//  Databasehandler.swift
//  Coredata2
//
//  Created by Sriram Prasad on 12/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import CoreData

class Databasehandler: NSObject {

    let contextmanager = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let shardInstance = Databasehandler()
   
    func saveData(object:[String:String]){
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: contextmanager) as! Person
            person.name = object["name"]
            person.city = object["city"]
        do {
            try contextmanager.save()
        }
        catch{
            print("error")
        }
        
        
    }
    func getData() -> [Person]{
        var person = [Person]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        do {
            person = try contextmanager.fetch(fetchRequest) as! [Person]
        }
        catch {
            print("error while fetching data")
        }
        return person
    }
    
    
    func deletedata(index:Int)-> [Person]
    {
        var person = getData()
        contextmanager.delete(person[index])
        person.remove(at: index)
        do {
            try contextmanager.save()
            
        }
        catch {
            print("error while deleteing data")
        }
        return person
    }
}

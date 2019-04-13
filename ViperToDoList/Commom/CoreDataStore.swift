//
//  CoreDataStore.swift
//  VIPER-SWIFT
//
//  Created by Conrad Stoll on 6/4/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStore : NSObject {
    static let sharedInstance = CoreDataStore()
    
    // MARK: - Core Data stack
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ViperToDoList")
        container.loadPersistentStores(completionHandler: { (storeDeion, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save() {
        try! self.persistentContainer.viewContext.save()
    }
    
    // MARK: - Application methods
    
    func fetchEntries(completionBlock: (([ToDoItem]) -> Void)!) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>  = NSFetchRequest(entityName: "ToDoItem")

        self.persistentContainer.viewContext.perform {
            let queryResults = try? self.persistentContainer.viewContext.fetch(fetchRequest)
            let managedResults = queryResults! as! [ToDoItem]
            completionBlock(managedResults)
        }
    }
    
    func newTodoItem() -> ToDoItem {
        let newEntry = NSEntityDescription.insertNewObject(forEntityName: "ToDoItem", into: self.persistentContainer.viewContext) as! ToDoItem
        return newEntry
    }
    
    
}

//
//  ToDoListWorker.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 13/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ToDoListWorker: ToDoListWorkerProtocol {
    func addItem(_ item: ToDoItemEntity) {
        let newEntry = CoreDataStore.sharedInstance.newTodoItem()
        newEntry.text = item.text
        newEntry.completed = false
        
        CoreDataStore.sharedInstance.save()
    }
    
    func fetchItems(completion: (([ToDoItemEntity]) -> Void)!) {
        CoreDataStore.sharedInstance.fetchEntries { items in
            let todoItems = self.todoItemsFromDataStore(items)
            completion(todoItems)
        }
    }
    
    func todoItemsFromDataStore(_ entries: [ToDoItem]) -> [ToDoItemEntity] {
        let todoItems : [ToDoItemEntity] = entries.map { item in
            ToDoItemEntity(id: item.objectID.description, completed: item.completed, text: item.text ?? "No description")
        }
        
        return todoItems
    }
}

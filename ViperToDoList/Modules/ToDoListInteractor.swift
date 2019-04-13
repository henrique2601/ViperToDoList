//
//  ToDoListInteractor.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 13/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ToDoListInteractor: ToDoListInteractorInputProtocol {
    var worker: ToDoListWorkerProtocol?
    weak var presenter: ToDoListInteractorOutputProtocol?
    
    func addItem(_ item: ToDoItemEntity) {
        worker?.addItem(item)
        fetchItems()
    }
    
    func changeItemStatus(_ item: ToDoItemEntity) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index] = item
//        }
//        presenter?.itemsDidFetch(items: items)
    }
    
    func fetchItems() {
        worker?.fetchItems { items in
            self.presenter?.itemsDidFetch(items: items)
        }
    }
}

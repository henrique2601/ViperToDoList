//
//  ToDoListProtocols.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 12/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit


protocol ToDoListViewProtocol: class {
    var presenter: ToDoListPresenterProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func reloadData(items: [ToDoItemEntity])
}


protocol ToDoListPresenterProtocol: class {
    var view: ToDoListViewProtocol? { get set }
    var interactor: ToDoListInteractorInputProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func addItem(_ item: ToDoItemEntity)
    func changeItemStatus(_ item: ToDoItemEntity)
    func fetchItems()
}

protocol ToDoListInteractorOutputProtocol: class {
    var view: ToDoListViewProtocol? { get set }
    
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func itemsDidFetch(items: [ToDoItemEntity])
}

protocol ToDoListInteractorInputProtocol: class {
    var presenter: ToDoListInteractorOutputProtocol? { get set }
    var worker: ToDoListWorkerProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func addItem(_ item: ToDoItemEntity)
    func changeItemStatus(_ item: ToDoItemEntity)
    func fetchItems()
}

protocol ToDoListWorkerProtocol: class {
    // Add here your methods for communication INTERACTOR -> WORKER
    func addItem(_ item: ToDoItemEntity)
    func fetchItems(completion: (([ToDoItemEntity]) -> Void)!)
}


protocol ToDoListRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func build() -> UIViewController
}

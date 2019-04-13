//
//  ToDoListPresenter.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 13/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ToDoListPresenter: ToDoListPresenterProtocol {
    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: ToDoListRouterProtocol?
    
    func addItem(_ item: ToDoItemEntity) {
        interactor?.addItem(item)
    }
    
    func changeItemStatus(_ item: ToDoItemEntity) {
        interactor?.changeItemStatus(item)
    }
    
    func fetchItems() {
        interactor?.fetchItems()
    }
}

extension ToDoListPresenter: ToDoListInteractorOutputProtocol {
    func itemsDidFetch(items: [ToDoItemEntity]) {
        view?.reloadData(items: items)
    }
}

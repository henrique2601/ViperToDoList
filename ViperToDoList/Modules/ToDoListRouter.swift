//
//  ToDoListRouter.swift
//  ViperToDoList
//
//  Created by Paulo Henrique dos Santos on 13/04/2019.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class ToDoListRouter: ToDoListRouterProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "ToDoListView", bundle: Bundle.main)
    }
    
    func build() -> UIViewController {
        let interactor = ToDoListInteractor()
        let presenter = ToDoListPresenter()
        let router = ToDoListRouter()
        let worker = ToDoListWorker()
        let viewController = storyboard.instantiateViewController(withIdentifier: "TodoList") as! ToDoListViewController
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        return viewController
    }
}

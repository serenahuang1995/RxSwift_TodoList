//
//  ViewController.swift
//  RxSwift_TodoList
//
//  Created by 黃瀞萱 on 2021/10/1.
//

import UIKit

class ListViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.description())
        return tableView
    }()
    
    private lazy var addBarButton: UIBarButtonItem = {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        return addButton
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addBarButton.target = self
        addBarButton.action = #selector(showTodoAlert(: ))
    }
    
    private func setupSubViews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        // Loading navigation item
//        let inducatorButton = UIBarButtonItem(customView: indicatorView)
//        navigationItem.leftBarButtonItem = inducatorButton
        // Add navigation item
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    @objc
    func showTodoAlert() {
        let alert = UIAlertController(
            title: "What you want to do?",
            message: "Insert your todo item",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Add",
            style: .default)
        
        alert.addAction(action)
    }
}


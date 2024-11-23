//
//  TodoListView.swift
//  TZTodo
//
//  Created by Дмитрий Трушин on 22/11/2024.
//

import Foundation
import UIKit

final class TodoListView: UIViewController {
    private var titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let todoTableView = UITableView()
    private let footerBarView = UIView()
    private var countTitleLebel = UILabel()
    private let addNewTaskButton = UIButton()
    private let buttonImage = UIImage(systemName: "square.and.pencil")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstrains()
        setupUI()
        configureTableView()
    }
    
    private func addSubViews() {
        view.addSubviews(titleLabel, searchBar, todoTableView, footerBarView, countTitleLebel, addNewTaskButton)
    }
    
    private func setupConstrains() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        todoTableView.translatesAutoresizingMaskIntoConstraints = false
        footerBarView.translatesAutoresizingMaskIntoConstraints = false
        countTitleLebel.translatesAutoresizingMaskIntoConstraints = false
        addNewTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            todoTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            todoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            todoTableView.bottomAnchor.constraint(equalTo: footerBarView.topAnchor),
            
            footerBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerBarView.heightAnchor.constraint(equalToConstant: 49 + 34),
            
            countTitleLebel.topAnchor.constraint(equalTo: footerBarView.topAnchor, constant: 20),
            countTitleLebel.leadingAnchor.constraint(equalTo: footerBarView.leadingAnchor),
            countTitleLebel.trailingAnchor.constraint(equalTo: footerBarView.trailingAnchor),
            
            addNewTaskButton.topAnchor.constraint(equalTo: footerBarView.topAnchor, constant: 5),
            addNewTaskButton.trailingAnchor.constraint(equalTo: footerBarView.trailingAnchor),
            addNewTaskButton.widthAnchor.constraint(equalToConstant: 68),
            addNewTaskButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func configureTableView() {
        todoTableView.backgroundColor = .black
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.register(TodoCustomCell.self, forCellReuseIdentifier: "TodoCustomCell")
    }
    
    private func setupUI() {
        titleLabel.text = "Задачи"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 34)
        titleLabel.textColor = .white
        
        searchBar.placeholder = "Search"
        searchBar.barTintColor = .black
        searchBar.searchTextField.backgroundColor = .gray
        
        footerBarView.backgroundColor = .gray
        
        countTitleLebel.text = "7 задач"
        countTitleLebel.textColor = .white
        countTitleLebel.textAlignment = .center
        countTitleLebel.font = UIFont.systemFont(ofSize: 11)
        
        addNewTaskButton.setImage(buttonImage, for: .normal)
        addNewTaskButton.tintColor = .yellow
    }
}

extension TodoListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = todoTableView.dequeueReusableCell(withIdentifier: "TodoCustomCell", for: indexPath) as? TodoCustomCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}

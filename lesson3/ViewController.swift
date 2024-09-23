//
//  ViewController.swift
//  lesson3
//
//  Created by Тагир Файрушин on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        return table
    }()
    
    var dataSource: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = Array(repeating: User(name: "Mark",
                                           lastName: "Sebyan",
                                           age: "32",
                                           avatarImage: UIImage(named: "avatar")), count: 30)
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = dataSource[indexPath.row]
        cell.configureCell(with: user)
//        let model = dataSource[indexPath.row]
//        var listConfiguration = cell.defaultContentConfiguration()
//        listConfiguration.text = model
//        listConfiguration.secondaryText = "123"
//        listConfiguration.secondaryTextProperties.alignment = .center
//        
//        cell.contentConfiguration = listConfiguration
//        var background = UIBackgroundConfiguration.listCell() // Стандартная конфигурация фона для обычной ячейки
//        background.backgroundColor = .systemGray6 // Цвет фона
//        
//        // Дополнительные настройки
//        background.cornerRadius = 10 // Закругленные углы
//        background.strokeWidth = 1 // Толщина рамки
//        background.strokeColor = .lightGray // Цвет рамки
//        background.backgroundInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
//        
//        cell.backgroundConfiguration = background // Применяем конфигурацию фона
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

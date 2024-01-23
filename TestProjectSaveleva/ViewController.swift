//
//  ViewController.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var names: [String] = ["Alexander", "Ivan", "Sergey"]

    private lazy var myTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        title = "Список подопечных"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Загрузить", style: .plain, target: self, action: #selector(didtapDownloadButton))
        view.addSubview(myTableView)
    }
    
    @objc 
    func didtapDownloadButton() {
        
    }
    
    private func setupConstraints() {
        
//        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        NSLayoutConstraint.activate([
            
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = UIListContentConfiguration.cell()
        configuration.text = names[indexPath.row]
        configuration.image = UIImage(named: "19")
        cell.contentConfiguration = configuration
        return cell
    }

}

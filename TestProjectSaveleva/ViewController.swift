//
//  ViewController.swift
//  TestProjectSaveleva
//
//  Created by Ekaterina Saveleva on 23.01.2024.
//

import UIKit
import Pomosch
import Kingfisher

class ViewController: UIViewController {
    
    private var viewModel = WardListViewModel()
    
    private lazy var myTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        loadMore()
        
    }
    
    private func loadMore() {
        viewModel.fetchWards { [weak self] in
            self?.myTableView.reloadData()
        }
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
        
        NSLayoutConstraint.activate([
            
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.wards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let ward = viewModel.wards[indexPath.row]
        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
        backgroundConfiguration.imageContentMode = .scaleAspectFill
        cell.backgroundConfiguration = backgroundConfiguration
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = ward.name
        
        if let url = URL(string: ward.photoUrlString) {
            KingfisherManager.shared.retrieveImage(with: url) { result in
               let image = try? result.get().image
                configuration.image = image
                cell.contentConfiguration = configuration
                
            }
        }
        
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.wards.count - 1 {
            loadMore()
        }
    }
}


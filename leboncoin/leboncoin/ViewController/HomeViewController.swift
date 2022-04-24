//
//  HomeViewController.swift
//  leboncoin
//
//  Created by Saiefeddine HAYOUNI on 23/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let HomeContentView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    var viewModel: HomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(service: Service.shared)
        setupTableView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.estimatedRowHeight = UITableView.automaticDimension

        HomeContentView.addSubview(tableView)
        view.addSubview(HomeContentView)
        setUpAutoLayout()
    }
    // MARK: - private function
    private func fetchData() {
        viewModel?.fetchData(completion: { [weak self] noError in
            guard let self = self else { return }
             if noError {
                self.tableView.reloadData()
            }
        })
    }
    func setUpAutoLayout() {
        tableView.leftAnchor.constraint(equalTo:HomeContentView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:HomeContentView.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo:HomeContentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:HomeContentView.bottomAnchor).isActive = true
        
        
        HomeContentView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        HomeContentView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        HomeContentView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        HomeContentView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true

    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        let entity = viewModel?.ListingeModel(at: indexPath)
        vc.viewModel = DetailsViewModel(item: entity) 
        navigationController?.pushViewController(vc, animated: true)
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HomeTableViewCell
        cell.listing = viewModel?.ListingeModel(at: indexPath)
        return cell
    }
    
}

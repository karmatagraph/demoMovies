//
//  MovieListViewController.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    // MARK: - Properties
    var model = [Movie]()

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
        private func setup() {
            title = "Discover"
            setupTableView()
            fetchData()
        }

        private func fetchData() {
            NetworkManager.getDiscover { [weak self] result in
                switch result {
                case .success(let movie):
                    self?.model = movie
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print("error getting data from the api::: \(error.localizedDescription)")
                }
            }
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
        }
        
    }

    extension MovieListViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            // navigate to the detail screen
            print("\(model[indexPath.row].originalTitle) clicked")
        }
        
    }

    extension MovieListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model[indexPath.row].originalTitle
            return cell
        }
        
    }

//
//  MovieListViewController.swift
//  MoviesDemoApp
//
//  Created by karma on 9/21/22.
//

import UIKit

class MovieListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
        private func setup() {
            setupTableView()
            fetchData()
        }

        private func fetchData() {
            NetworkManager.getPopular { [weak self] result in
                print(result)
            }
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .systemPink
        }
        
    }

    extension MovieListViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            // navigate to the detail screen
            print("movie \(indexPath.row) clicked")
        }
        
    }

    extension MovieListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "movies \(indexPath.row)"
            return cell
        }
        
    }
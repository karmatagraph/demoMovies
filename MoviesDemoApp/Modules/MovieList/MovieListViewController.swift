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
    private var isMoreMoviesAvailable: Bool = false

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
            NetworkManager.getApi(with: Endpoints.discover.url, expecting: Discover.self) { [ weak self ] result in
                switch result {
                case .success(let discoverModel):
                    self?.model = discoverModel.results
                    if discoverModel.page == discoverModel.totalPages {
                        self?.isMoreMoviesAvailable = false
                    } else {
                        self?.isMoreMoviesAvailable = true
                    }
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    print("failed to get data from api:::\(error.localizedDescription)")
                }
            }
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
//            tableView.register(UINib(nibName: MovieListTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: MovieListTableViewCell.identifier)
        }
        
    }

    // MARK: - TableView Delegate
    extension MovieListViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let destVC = UIStoryboard(name: "MovieDetailStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailStoryboard") as! MovieDetailViewController
            destVC.movie = model[indexPath.row]
            destVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(destVC, animated: true)
        }
        
        // MARK: - TableView footer
        private func setupFooterView() {
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
            tableView?.tableFooterView = spinner
        }
        
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let lastRowIndex = tableView.numberOfRows(inSection: 0)
            if indexPath.item == (lastRowIndex - 1) && isMoreMoviesAvailable {
                setupFooterView()
                print("get more data")
                fetchData()
            } else {
                tableView.tableFooterView = nil
            }
        }
        
    }

    // MARK: - TableView Datasource
    extension MovieListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: MovieListTableViewCell = tableView.dequeueCell(for: indexPath)
            let movie = model[indexPath.row]
            cell.configure(with: movie)
            return cell
        }
        
    }

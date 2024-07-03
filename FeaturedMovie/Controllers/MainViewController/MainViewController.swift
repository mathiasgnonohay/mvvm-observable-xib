//
//  MainViewController.swift
//  FeaturedMovie
//
//  Created by Mathias Nonohay on 03/07/24.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    private func configureView() {
        self.title = "Movies"
        
        self.configureTableView()
    }
}

// MARK: - UITableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

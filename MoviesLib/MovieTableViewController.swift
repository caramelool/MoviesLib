//
//  MovieTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 28/03/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    private var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadLocalJSON()
    }

    private func loadLocalJSON() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { return }
        do {
            movieList = try JSONDecoder().decode([Movie].self, from: data)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        cell.movie = movieList[indexPath.row]
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieViewController {
//            guard let row = tableView.indexPathForSelectedRow?.row else { return }
//            vc.movie = movieList[row]
            if let cell = sender as? MovieTableViewCell {
                vc.movie = cell.movie
            }
        }
    }

}

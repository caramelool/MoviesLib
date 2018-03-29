//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 28/03/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSummary: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    
    var movie: Movie! {
        didSet {
            imgMovie.image = UIImage(named: movie.imageSmall)
            lbTitle.text = movie.title
            lbSummary.text = movie.summary
            lbRating.text = movie.rateDescription
            lbCategories.text = movie.categoriesDescription
        }
    }

}

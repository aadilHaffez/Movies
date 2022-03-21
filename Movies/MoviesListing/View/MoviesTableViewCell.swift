//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by aadil khaskheli on 21/03/2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewMovies: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(news: Movie) {
        

        DispatchQueue.main.async {
            self.labelTitle.text = news.title
            self.labelDate.text = news.release_date?.getYearFromDate()
        }
        
        //Check count to avoid crash - index out of bound
        if let media = news.poster_path,
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(media)")  {
                    self.imageViewMovies.downloaded(from: url)
        }
    }
    
}

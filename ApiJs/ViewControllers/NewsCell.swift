//
//  NewsCell.swift
//  ApiJs
//
//  Created by Vadim Kontush on 27.11.21.
//

import UIKit


class NewsCell: UITableViewCell{
    
    @IBOutlet var imageNews: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var descriptionNews: UILabel!
    
    func configure(with news: News){
        
        title.text = news.title
        author.text = news.author
        descriptionNews.text = news.description

        
//        DispatchQueue.global().async {
//            guard let stringURL = news.image else { return }
//            guard let url = URL(string: stringURL) else { return }
//            guard let imageData = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self.courseImage.image = UIImage(data: imageData)
//            }
//        }
    }
}


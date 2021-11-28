//
//  ViewController.swift
//  ApiJs
//
//  Created by Vadim Kontush on 26.11.21.
//

import UIKit

enum Link: String {
    case jokeUrl = "https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,religious,political,sexist,explicit&type=twopart"
    case imageRandomUrl = "https://random.imagecdn.app/500/200"
    case newsUrl = "https://api.currentsapi.services/v1/latest-news?language=en&apiKey=84AATyvQJibuMRanyzajOeinUflnsfNWdSb-gBbc44V0HbxJ"
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jokeVC" {
            guard let jokesVC = segue.destination as? JokesViewController else { return }
            jokesVC.fetchJoke()
            jokesVC.fetchImages()
    }
        if segue.identifier == "newsTBC"{
            guard let newsTBC = segue.destination as? NewsTableViewController else { return }
            newsTBC.fetchNews()
        }
    }
}

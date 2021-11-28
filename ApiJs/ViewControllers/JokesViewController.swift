//
//  JokesViewController.swift
//  ApiJson
//
//  Created by Vadim Kontush on 26.11.21.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet var jokeLabelMain: UILabel!
    @IBOutlet var jokeLabelAnswer: UILabel!
    @IBOutlet var imageFirst: UIImageView!
    @IBOutlet var imageSecond: UIImageView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        imageFirst.layer.shadowColor = UIColor.black.cgColor
        imageFirst.layer.shadowOpacity = 0.3
        imageFirst.layer.shadowOffset = CGSize(width: 7, height: 7)
        imageFirst.layer.shadowRadius = 6.0
    }
    
    private func alertController(title:String, message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func buttonJoke(_ sender: UIButton ) {
        sender.pulsate()
        
        fetchJoke()
        fetchImages()
    }
}
extension JokesViewController{
    func fetchJoke(){
        guard let url = URL(string: Link.jokeUrl.rawValue) else { return }
        
                URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data else {
                        print(error?.localizedDescription ?? "No description")
                        return
                    }
                    do {
                        let joke = try JSONDecoder().decode(Joke.self, from: data)
                        DispatchQueue.global().async {
                        }
                        DispatchQueue.main.async {
                            //self.view.reloadInputViews()
                            self.jokeLabelMain.text = joke.setup
                            self.jokeLabelAnswer.text = joke.delivery
                            self.activityIndicator.stopAnimating()
                        }
                    } catch let error{
                        self.alertController(title: "Failed", message: "Smth wrong")
                        print(error.localizedDescription)
                    }
                }.resume()
    }
    
    func fetchImages() {
        guard let url = URL(string: Link.imageRandomUrl.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageFirst.image = image
            }
        }.resume()
        
        guard let url2 = URL(string: Link.imageRandomUrl.rawValue) else { return }
        URLSession.shared.dataTask(with: url2) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageSecond.image = image
            }
        }.resume()
    }
}

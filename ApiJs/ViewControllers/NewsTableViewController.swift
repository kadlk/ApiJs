//
//  NewsTableViewController.swift
//  ApiJs
//
//  Created by Vadim Kontush on 27.11.21.
//

import UIKit

class NewsTableViewController: UITableViewController {

    private var testWelcome: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testWelcome?.news.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        let newsOne = testWelcome!.news[indexPath.row]

        cell.configure(with: newsOne)
        return cell
    }
}

extension NewsTableViewController{
    func fetchNews(){
        guard let url = URL(string: Link.newsUrl.rawValue) else { return }

                URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data else {
                        print(error?.localizedDescription ?? "No description")
                        return
                    }
                    do {
                        self.testWelcome = try! JSONDecoder().decode(Welcome.self, from: data)
                        print(self.testWelcome?.news.first?.title ?? "")
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }.resume()
    }
}





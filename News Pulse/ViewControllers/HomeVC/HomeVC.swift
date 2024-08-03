//
//  HomeVC.swift
//  News Pulse
//
//  Created by alagu-raja
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = NewsViewModel()
    
    private var articles: [Article] {
        return viewModel.articles
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
        setup()
        getNews()
    }
    
    func setup(){
        
        //REGISTER CELl
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func getNews(){
        viewModel.getNews(type: .TOP_HEADLINES){ status in
            if status{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

//MARK: UITABLEVIEW DELGATE & DATA-SOURCE METHOD
extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.config(data: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let articleVC = ArticleVC(article: article)
        navigationController?.pushViewController(articleVC, animated: true)
//        articleVC.modalPresentationStyle = .fullScreen
//        self.present(articleVC, animated: true)
    }
    
}

//
//  PostsViewController.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import UIKit

class PostsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameUseField: UILabel!
    @IBOutlet weak var phoneUserField: UILabel!
    @IBOutlet weak var emailUserField: UILabel!
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var userId: Int = 0
    var name = ""
    var phone = ""
    var email = ""
    
    private var dataPosts = [PostsData]()
    
    var postModel: PostsProtocols?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameUseField.text = name
        self.phoneUserField.text = phone
        self.emailUserField.text = email
        
        setupModel()
        postsTableView.dataSource = self
        postsTableView.delegate = self
        
        postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
        getPosts(userId: userId)

    }
    
    fileprivate func setupModel() {
        if postModel == nil {
            setModel(PostsModel())
        }
    }
    
    func setModel(_ Model: PostsProtocols){
        postModel = Model
    }
    
    //MARK: Get and list posts
    func getPosts(userId: Int){
        postModel?.getPostUser(userId: userId,completion: { result in
            if (result.0 != nil){
                self.dataPosts.append(contentsOf: result.0)
                self.postsTableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath)
        if let cell = cell as? PostsTableViewCell {
            cell.setupCellWith(post: self.dataPosts[indexPath.row])
        }
        return cell
    }
}

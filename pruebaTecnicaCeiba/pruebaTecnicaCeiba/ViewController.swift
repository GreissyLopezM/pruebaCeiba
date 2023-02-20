//
//  ViewController.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import UIKit
import NotificationBannerSwift

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate  {
   
    @IBOutlet weak var usersListTable: UITableView!
    
    private var dataUser = [UserData]()
    
    var userModel: UsersProtocols?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        usersListTable.dataSource = self
        usersListTable.delegate = self
        
        usersListTable.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        getUsers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        getUsers()
    }
    
    fileprivate func setupModel() {
        if userModel == nil {
            setModel(UsersModel())
        }
    }
    
    func setModel(_ Model: UsersProtocols){
        userModel = Model
    }
    
    //MARK: Filter
    @IBAction func filterUsers(_ sender: UITextField) {
        if let searchFilter = sender.text{
            dataUser = searchFilter.isEmpty ? dataUser : dataUser.filter{ $0.name.contains(searchFilter)}
            usersListTable.reloadData()
            if dataUser.count == 0{
                NotificationBanner(title: "List is empty", style: .warning).show()
            }
        }
    }
    
    //MARK: Get and list users
    func getUsers(){
        userModel?.getUsers(completion: { result in
            if (result.0 != nil){
                self.dataUser.append(contentsOf: result.0)
                self.usersListTable.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
        if let cell = cell as? UserTableViewCell {
            
            let idUser = indexPath.row + 1
            let nameUser = dataUser[indexPath.row].name
            let phoneUser = dataUser[indexPath.row].phone
            let emailUser = dataUser[indexPath.row].email
            
            cell.setupCellWith(userData: self.dataUser[indexPath.row])
            cell.tabBtn = {
                let vc = (UIStoryboard.init(name: "Posts", bundle: Bundle.main).instantiateViewController(withIdentifier: "posts") as? PostsViewController)
                vc?.userId = idUser
                vc?.name = nameUser
                vc?.phone = phoneUser
                vc?.email = emailUser
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        }
        return cell
    }
}


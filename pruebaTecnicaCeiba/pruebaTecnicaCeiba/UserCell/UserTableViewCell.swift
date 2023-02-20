//
//  UserTableViewCell.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var viewPostsButton: UIButton!
    var tabBtn: (() ->Void)? = nil
    
    override func awakeFromNib() {
  
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCellWith(userData: UserData){
        userName.text = userData.name
        userPhone.text = userData.phone
        userEmail.text = userData.email
    }
    
    @IBAction func viewPostsBtnn(_ sender: UIButton) {
        tabBtn?()
    }
    
}

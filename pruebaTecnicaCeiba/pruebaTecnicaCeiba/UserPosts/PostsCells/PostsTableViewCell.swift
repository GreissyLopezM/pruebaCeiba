//
//  PostsTableViewCell.swift
//  pruebaTecnicaCeiba
//
//  Created by Loducode Retina on 19/02/23.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var bodyPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCellWith(post: PostsData){
        titlePost.text = post.title
        bodyPost.text = post.body
    }
    
}

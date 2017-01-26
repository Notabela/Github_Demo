//
//  RepoCell.swift
//  GithubDemo
//
//  Created by daniel on 1/20/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell
{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var githubRepo: GithubRepo!
    {
        didSet
        {
            name.text = githubRepo.name
            author.text = githubRepo.ownerHandle
            stars.text = "\(githubRepo.stars!)"
            forks.text = "\(githubRepo.forks!)"
            repoDescription.text = githubRepo.repoDescription
            profileImage.setImageWith(URL(string:githubRepo.ownerAvatarURL!)!)
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

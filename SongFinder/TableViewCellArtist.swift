//
//  TableViewCellArtist.swift
//  SongFinder
//
//  Created by Deniz MacBook Air on 7.10.2019.
//  Copyright © 2019 MacBook Air. All rights reserved.
//

import UIKit

class TableViewCellArtist: UITableViewCell {

    @IBOutlet weak var lblArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

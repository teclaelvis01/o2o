//
//  cellBearTableViewCell.swift
//  FindBears
//
//  Created by Elvis Reyes on 13/01/2020.
//  Copyright © 2020 Elvis Reyes. All rights reserved.
//

import UIKit

class cellBearTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgBear: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

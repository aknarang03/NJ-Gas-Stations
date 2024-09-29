//
//  GasStationsTableViewCell.swift
//  NJ Gas Stations
//
//  Created by Anjali Narang  on 9/29/24.
//

import UIKit

class GasStationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var go: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

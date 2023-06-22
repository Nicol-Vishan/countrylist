//
//  CountryTableViewCell.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    func setupUI(tableView: UITableView,cName: String,cFlag: String) {
        countryName.text = cName
        guard let imgUrl = URL(string: cFlag) else { return }
        countryFlag.loadImage(url: imgUrl)
        countryFlag.layer.cornerRadius = countryFlag.frame.size.height/2.0
        countryFlag.clipsToBounds = true
        countryName.preferredMaxLayoutWidth = tableView.frame.size.width;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

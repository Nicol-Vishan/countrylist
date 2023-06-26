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

    func setupCell(_ viewModel: CountryTableCellViewModel) {
        countryName.text = viewModel.countryName
        guard let imgUrl = URL(string: viewModel.countryImgUrl) else { return
        }
        countryFlag.loadImage(url: imgUrl)
        countryFlag.layer.cornerRadius = countryFlag.frame.size.height/2.0
        countryFlag.clipsToBounds = true
        
    }
}

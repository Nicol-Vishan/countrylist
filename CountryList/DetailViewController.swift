//
//  DetailViewController.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    
    var countryDetail: Countries?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = countryDetail?.name?.official
        setupUI()
    }
    
    func setupUI() {
        countryName.text = countryDetail?.name?.official
        countryRegion.text =  countryDetail?.region
        if let imgUrl = URL(string: (countryDetail?.flags?.png)!){
            countryFlag.loadImage(url: imgUrl)
        }
    }

}

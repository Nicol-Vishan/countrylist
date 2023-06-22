//
//  DetailViewController.swift
//  CountryList
//
//  Created by Nicol Vishan on 12/10/22.
//

import UIKit

enum CountryError: Error {
    case countryFlagNotFound
    case countryCoatOfArmsImageNotFound
    case countryDetailsNotFound
}

class DetailViewController: UIViewController {

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var subOrigin: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var lblOfficial: UILabel!
    
    @IBOutlet weak var imgcoatOfArms: UIImageView!
    
    
    var countryDetail: Countries?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = countryDetail?.name.common
        do {
            try setupUI()
            print("Country details loaded sucessfully..")
        } catch CountryError.countryDetailsNotFound {
            print("Sorry missing country details..")
        } catch CountryError.countryFlagNotFound {
            print("Sorry country images not found...")
        } catch CountryError.countryCoatOfArmsImageNotFound {
           print("Sorry country coat of arms image not found")
        } catch {
            print("Unknown error found \(error)")
        }

    }
    
    func setupUI() throws {

        guard let countryDetail = countryDetail else {
            throw CountryError.countryDetailsNotFound
        }
        guard let countryImgUrl = URL(string: countryDetail.flags.png ?? "") else {
            throw CountryError.countryFlagNotFound
        }
        countryName.text = countryDetail.name.common
        countryRegion.text =  countryDetail.region
        countryFlag.loadImage(url: countryImgUrl)
        subOrigin.text = countryDetail.subregion
        lblCapital.text = countryDetail.capital?.first
        lblLanguages.text = countryDetail.languages?.first?.value
        lblOfficial.text = countryDetail.name.official
        try getSubImg(countryDetail)
    }

    func getSubImg(_ countryDetail: Countries) throws {
        guard let countrySubImgUrl = URL(string: countryDetail.coatOfArms.png ?? "") else {
            throw CountryError.countryCoatOfArmsImageNotFound
        }
        imgcoatOfArms.loadImage(url: countrySubImgUrl)
    }
    

}

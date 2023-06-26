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
    
    
    var viewModel: CountryDetailViewModel

    required init?(coder: NSCoder, viewModel: CountryDetailViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let countryImgUrl = URL(string: viewModel.countryFlag) else {
            throw CountryError.countryFlagNotFound
            }
        self.title = viewModel.countryName
        countryName.text = viewModel.countryName
        countryRegion.text =  viewModel.countryRegion
        countryFlag.loadImage(url: countryImgUrl)
        subOrigin.text = viewModel.subOrigin
        lblCapital.text = viewModel.capital
        lblLanguages.text = viewModel.languages
        lblOfficial.text = viewModel.official
        try getSubImg(viewModel)
    }

    func getSubImg(_ countryDetail: CountryDetailViewModel) throws {
        guard let countrySubImgUrl = URL(string: countryDetail.countryCoatOfArms) else {
            throw CountryError.countryCoatOfArmsImageNotFound
        }
        imgcoatOfArms.loadImage(url: countrySubImgUrl)
    }
    

}

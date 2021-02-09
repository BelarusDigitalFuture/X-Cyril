//
//  ConnectToBankViewController.swift
//  XmartRegistration
//
//  Created by Mac on 21.03.2020.
//  Copyright © 2020 Xmart. All rights reserved.
//

import UIKit
import XmartExpansion
import XmartDomainModule

class ConnectToBankViewController: UIViewController {
    
    @IBOutlet weak var bankLocationButton: UIButton!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var selectCountryLabel: UILabel!

    private let viewModel  = BankConnectViewModel()
    
    
    var countriesList:[String]?
    var selectCountry:String = ""
    var banksList:[Bank]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindObservers()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "cardInfo")
        UserDefaults.standard.set(true, forKey: "isLogin")
      //  let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      //  let viewController  = mainStoryboard.instantiateViewController(withIdentifier: "isLogin")
      //  viewController.modalPresentationStyle = .fullScreen
      //  self.present(viewController, animated: true, completion: nil)
        if(banksList != nil){
            performSegue(withIdentifier: "selectBankSegue", sender: nil)
        }
    }
    
    private func getBanksForSelectedCountry(_ code: String) {
        viewModel.loadBanks(countryCode: code)
    }
    //SelectBankLocationSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is SelectCountryViewController){
            (segue.destination as! SelectCountryViewController).countriesList = countriesList!
            (segue.destination as! SelectCountryViewController).parentView = self
        }else if(segue.destination is SelectBankViewController){
            (segue.destination as! SelectBankViewController).banksList = banksList!
        }
    }
    
    public func changeCountry(selectCountryIndex:Int){
        selectCountryLabel.isHidden = true
        countryImage.isHidden = false
        countryNameLabel.isHidden = false
        
        selectCountry = countriesList![selectCountryIndex]
        if let countryIndex = countryesInfoList.firstIndex(where: {$0[0] as! String == countriesList![selectCountryIndex]}){
            countryImage.image = countryesInfoList[countryIndex][2] as? UIImage
            countryNameLabel.text = (countryesInfoList[countryIndex][0] as! String)
        }
        viewModel.loadBanks(countryCode: selectCountry)
    }
    
    private func bindObservers()  {
        viewModel.countries.bind { status in
            switch(status) {
            case .loading:
                //Загружается список банков(показывай UI загрузки)
                print("show loading")
            case .success(let countries):
                //Все ок, пришли страны
                self.countriesList = countries.countriesList
                print(countries)
            case .failure(let error):
                //Ошибка произошла(Показывай ошибку)
                print(error)
            }
        }
        viewModel.banksList.bind { banksStatus in
            switch(banksStatus) {
            case .loading:
                print("banks loading")
            case .success(let banksList):
                print(banksList)
                self.banksList = banksList
            case .failure(let error):
                print(error)
            case .none:
                print("empty")
            }
        }
    }
    @IBAction func selectBankLocation(_ sender: Any) {
        if(countriesList != nil){
            performSegue(withIdentifier: "SelectBankLocationSegue", sender: nil)
        }
    }
    
    
}

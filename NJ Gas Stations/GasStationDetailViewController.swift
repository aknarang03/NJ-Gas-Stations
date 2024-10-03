//
//  GasStationDetailViewController.swift
//  NJ Gas Stations
//
//  Created by Anjali Narang  on 10/1/24.
//

import UIKit

class GasStationDetailViewController: UIViewController {
    
    var showGasStationId: Int?
    var selectedStation: GasPump?
    let gasStationModel = GasPumpsModel.sharedInstance


    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let gasStationId = showGasStationId {
            selectedStation = gasStationModel.getGasPumpInfo(objectId: gasStationId)
            if (selectedStation != nil) {
                self.title = selectedStation?.name
                let assetName = gasStationModel.getImage(gasStationName: selectedStation!.name)
                logo.image = UIImage(named:assetName)
                address.text = selectedStation?.address
                // also add line 2 if it exists
                city.text = selectedStation?.city
            }
        }
    }
    
    @IBAction func priceSliderChange(_ sender: UISlider) {
        let priceValue = sender.value
        price.text = String (format: "$%.2f", priceValue)
    }
    
//    @IBAction func sliderValueSet(_ sender: UISlider) {
//        let fillValue = sender.value
//        price.text = String (format: "%.2f", fillValue)
//    }
    
}

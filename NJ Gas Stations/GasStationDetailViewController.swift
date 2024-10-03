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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let gasStationId = showGasStationId {
            
            selectedStation = gasStationModel.getGasPumpInfo(objectId: gasStationId)
            
            if (selectedStation != nil) {
                
                self.title = selectedStation?.name
                let assetName = gasStationModel.getImage(gasStationName: selectedStation!.name)
                logo.image = UIImage(named:assetName)
                
                if (selectedStation?.address2 != nil) {
                    address.text = selectedStation!.address + " " + selectedStation!.address2
                } else {
                    address.text = selectedStation?.address
                }
                
                city.text = selectedStation?.city
                
                slider.value = Float(selectedStation!.price)
                price.text = String(format: "$%.2f", selectedStation!.price)
                
            }
            
        }
        
    }
    
    @IBAction func priceSliderChange(_ sender: UISlider) {
        
        let priceValue = sender.value
        price.text = String (format: "$%.2f", priceValue)
        
        if (selectedStation != nil) {
            let _ = gasStationModel.updateGasPumpPrice(objectId: selectedStation!.objectId, newPrice: Double(priceValue))
        }
        
    }
    
}

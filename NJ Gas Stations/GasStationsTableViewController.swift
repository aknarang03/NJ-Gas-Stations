//
//  GasStationsTableViewController.swift
//  NJ Gas Stations
//
//  Created by Anjali Narang  on 9/29/24.
//

import UIKit

class GasStationsTableViewController: UITableViewController {
    
    let gasStationModel = GasPumpsModel.sharedInstance
    var gasStations: [GasPump] = []
    var selectedStationId: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gasStations = gasStationModel.gasPumps
        self.tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print ("view disappeared")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gasStations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gasStationCell", for: indexPath) as! GasStationsTableViewCell

        cell.city.text = gasStations[indexPath.row].city
        cell.name.text = gasStations[indexPath.row].name
        cell.price.text = String(format:"$%.2f",gasStations[indexPath.row].price)

        // set image based on search
        let assetName = gasStationModel.getImage(gasStationName: gasStations[indexPath.row].name)
        cell.logo.image = UIImage(named:assetName)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStationId = gasStations[indexPath.row].objectId
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailSegue") {
            let destinationViewController = segue.destination as! GasStationDetailViewController
            destinationViewController.showGasStationId = selectedStationId
        }
        
    }

}

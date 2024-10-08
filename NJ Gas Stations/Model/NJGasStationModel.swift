//
//  NJGasStationModel.swift
//  NJ Gas Stations
//
//  Created by Anjali Narang  on 9/29/24.
//

import Foundation

struct GasPump:Codable {
    
    var name:String
    var city:String
    var longitude:Double
    var latitude:Double
    var county: String
    var objectId: Int
    var address: String
    var address2: String
    var price: Double
    var brand: String = "generic"
    
    enum CodingKeys: String, CodingKey {
        case name = "SITE_NAME"
        case city = "CITY"
        case longitude = "LONGITUDE"
        case latitude = "LATITUDE"
        case county = "COUNTY"
        case objectId = "OBJECTID"
        case address = "ADDRESS_LINE_1"
        case address2 = "ADDRESS_LINE_2"
        case price = "PRICE"
    }
    
}

class GasPumpsModel {
    
    var gasPumps:[GasPump] = []
    
    var brandNames = [
        "76",
        "bp",
        "chevron",
        "citgo",
        "delta",
        "exxon",
        "getty",
        "gulf",
        "lukoil",
        "mobil",
        "phillips_66",
        "quick_chek",
        "shell",
        "speedway",
        "sunoco",
        "texaco",
        "wawa"
    ]
        
    static let sharedInstance = GasPumpsModel() // make the class object a Singleton
        
    private init () {
        readPumpsData()
    }
    
    func getImage(gasStationName: String) -> String {
        
        var asset : String
        let searchString = gasStationName.lowercased().replacingOccurrences(of: " ", with: "_")

        for assetName in brandNames {
            
            if (searchString.contains(assetName)) {
                
                // found
                asset = assetName
                return asset
                
            }
            
        }
        
        // not found
        asset = "generic"
        return asset

    }
    
    func readPumpsData() {
        
        if let filename = Bundle.main.path(forResource: "NJ-GasStations", ofType: "json") {
            
            do {
                let jsonStr  = try String (contentsOfFile: filename, encoding: .utf8)
                let jsonData = jsonStr.data(using: .utf8)!
                gasPumps = try! JSONDecoder().decode([GasPump].self, from: jsonData)
            }
            
            catch {
                print("The file could not be loaded")
            }
            
        } else {
            print ("The file could not be found")
        }
        
    }
    
    func getPumps() -> [GasPump] {
        return self.gasPumps
    }
    
    func getGasPumpInfo (objectId: Int) -> GasPump? {
        if let gasPump = gasPumps.first(where: {$0.objectId == objectId}) {
            return gasPump
        } else {
            return nil
        }
    }
        
    func updateGasPumpPrice (objectId: Int, newPrice price: Double) -> Bool {
        if let index = gasPumps.firstIndex(where: {$0.objectId == objectId}) {
            gasPumps[index].price = price
            print (gasPumps[index])
            return true
        } else {
            return false
        }
    }
    
}

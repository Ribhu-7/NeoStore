//
//  StoreViewController.swift
//  NeoStoreMVVM
//
//  Created by Apple on 16/07/24.
//

import MapKit
import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationHead = ["Mumbai" , "New Delhi" ,"Kolkata","Pune","Ahmedabad"]
    var locationDesc = ["Sigma IT Park, Rabale","J&K Block Laxmi Nagar","Technopolis 11th floor Saltlake","Vallabh Nagar, Pimpri Chinchwad", "5th Floor Gandhinagar, Makarba "]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Store Locator"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_icon"), style: .plain, target: self, action: #selector(searchClicked))
        let pune = Capital(title: "Pune", coordinate: CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567), info: "Home to the 2012 Summer Olympics.")
        let delhi = Capital(title: "New Delhi", coordinate: CLLocationCoordinate2D(latitude: 28.6139, longitude: 77.2088), info: "Founded over a thousand years ago.")
        let ahmd = Capital(title: "Ahmedabad", coordinate: CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714), info: "Often called the City of Light.")
        let kolkata = Capital(title: "Kolkata", coordinate: CLLocationCoordinate2D(latitude: 22.5744, longitude: 88.3629), info: "Has a whole country inside it.")
        let mumbai = Capital(title: "Mumbai", coordinate: CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777), info: "Named after George himself.")
        mapView.addAnnotations([pune, delhi, ahmd, kolkata, mumbai])

        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "StoreTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "StoreTableViewCell")
        
        LocationManager.shared.getUserLocation{ [weak self]
            location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                let pin = MKPointAnnotation()
                pin.coordinate = location.coordinate
                strongSelf.mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
                strongSelf.mapView.addAnnotation(pin)
            }
        }
    }
    

    @objc func searchClicked(){
        
    }
   

}

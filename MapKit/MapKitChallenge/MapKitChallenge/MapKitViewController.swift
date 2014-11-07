//
//  ViewController.swift
//  MapKitChallenge
//
//  Created by Tyron Allen on 11/6/14.
//  Copyright (c) 2014 Tyron Allen. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var latitude:CLLocationDegrees = 38.97246
        var longitude:CLLocationDegrees = -92.315984
        var latDelta:CLLocationDegrees = 0.03
        var lonDelta:CLLocationDegrees = 0.03
        
        var span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


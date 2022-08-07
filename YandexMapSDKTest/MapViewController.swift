//
//  MapViewController.swift
//  YandexMapSDKTest
//
//  Created by Aleksandr Rybachev on 07.08.2022.
//

import UIKit
import YandexMapsMobile

class MapViewController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: YMKMapView!
    
    let targetLocation = YMKPoint(latitude: 55.751574, longitude: 37.573856)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCamera()
        mapView.mapWindow.map.addCameraListener(with: self)
        
    }
    
    private func setCamera() {
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: targetLocation, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
    
}

extension MapViewController: YMKMapCameraListener {
    
    func onCameraPositionChanged(with map: YMKMap, cameraPosition: YMKCameraPosition, cameraUpdateReason: YMKCameraUpdateReason, finished: Bool) {
        if finished {
            addressLabel.text = nil
            addressLabel.text = String(cameraPosition.target.longitude)
        }
    }
}

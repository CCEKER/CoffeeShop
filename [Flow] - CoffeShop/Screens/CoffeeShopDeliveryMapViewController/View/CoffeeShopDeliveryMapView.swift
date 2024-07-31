//
//  CoffeeShopDeliveryMapView.swift
//  CoffeShop
//
//  Created by Cagatay Ceker on 25.03.2024.
//

import UIKit
import MapKit

class CoffeeShopDeliveryMapView: UIView {
    
    let customProgressView = CustomProgressView()
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsUserLocation = true
        view.isScrollEnabled = true
        return view
    }()
    
    private let holderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deliveryTimeLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.init(rgb: 0x303336)
        view.font = UIFont(name: "Sora", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deliveryTitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x808080)
        view.textAlignment = .center
        return view
    }()
    
    private let deliveryAddressLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textColor = UIColor.init(rgb: 0x303336)
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var deliveryAdressStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [deliveryTitleLabel, deliveryAddressLabel])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let deliveredYourOrderHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
        return view
    }()
    
    private let driverIconHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
        return view
    }()
    
    private let deliveredOrderTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x303336)
        view.numberOfLines = 0
        return view
    }()
    
    private let deliveredOrderSubtitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 2
        view.textColor = UIColor.init(rgb: 0x808080)
        return view
    }()
    
    private let driverIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var deliveredOrderTitleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [deliveredOrderTitle, deliveredOrderSubtitle])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 6
        return view
    }()
    
    private lazy var driverStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [driverIconHolderView, deliveredOrderTitleStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        return view
    }()
    
    private let driverImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let driverName: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = UIColor.init(rgb: 0x303336)
        view.numberOfLines = 0
        return view
    }()
    
    private let driverJob: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Sora", size: 12)
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor.init(rgb: 0x808080)
        view.numberOfLines = 0
        return view
    }()
    
    private let driverPhoneHolderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.init(rgb: 0xFFFFFF)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false
        return view
    }()
    
    private let driverPhoneIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var driverNameStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [driverName, driverJob])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 6
        return view
    }()
    
    private lazy var driverImageStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [driverImage, driverNameStackView, driverPhoneHolderView])
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customProgressView.randomizeProgress()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.init(rgb: 0xF5F5F5)
        addSubview(mapView)
        addSubview(holderView)
        holderView.addSubview(deliveryTimeLabel)
        holderView.addSubview(deliveryAdressStackView)
        holderView.addSubview(customProgressView)
        holderView.addSubview(deliveredYourOrderHolderView)
        driverIconHolderView.addSubview(driverIcon)
        deliveredYourOrderHolderView.addSubview(driverStackView)
        driverPhoneHolderView.addSubview(driverPhoneIcon)
        holderView.addSubview(driverImageStackView)
        customProgressView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            holderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            holderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            holderView.heightAnchor.constraint(equalToConstant: 322),
            
            deliveryTimeLabel.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 30),
            deliveryTimeLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            
            deliveryAdressStackView.topAnchor.constraint(equalTo: deliveryTimeLabel.bottomAnchor, constant: 6),
            deliveryAdressStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 109),
            deliveryAdressStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -109),
            
            customProgressView.topAnchor.constraint(equalTo: deliveryAdressStackView.bottomAnchor, constant: 20),
            customProgressView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            customProgressView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -30),
            customProgressView.heightAnchor.constraint(equalToConstant: 4),
            
            deliveredYourOrderHolderView.topAnchor.constraint(equalTo: customProgressView.bottomAnchor, constant: 12),
            deliveredYourOrderHolderView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            deliveredYourOrderHolderView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -30),
            deliveredYourOrderHolderView.heightAnchor.constraint(equalToConstant: 90),
            
            driverIconHolderView.heightAnchor.constraint(equalToConstant: 62),
            driverIconHolderView.widthAnchor.constraint(equalToConstant: 62),
            
            driverIcon.widthAnchor.constraint(equalTo: driverIconHolderView.widthAnchor, multiplier: 0.5),
            driverIcon.heightAnchor.constraint(equalTo: driverIconHolderView.heightAnchor, multiplier: 0.5),
            driverIcon.centerXAnchor.constraint(equalTo: driverIconHolderView.centerXAnchor),
            driverIcon.centerYAnchor.constraint(equalTo: driverIconHolderView.centerYAnchor),
            
            driverStackView.topAnchor.constraint(equalTo: deliveredYourOrderHolderView.topAnchor, constant: 14),
            driverStackView.bottomAnchor.constraint(equalTo: deliveredYourOrderHolderView.bottomAnchor, constant: -14),
            driverStackView.leadingAnchor.constraint(equalTo: deliveredYourOrderHolderView.leadingAnchor, constant: 16),
            driverStackView.trailingAnchor.constraint(equalTo: deliveredYourOrderHolderView.trailingAnchor, constant: -16),
            
            driverPhoneHolderView.heightAnchor.constraint(equalToConstant: 54),
            driverPhoneHolderView.widthAnchor.constraint(equalToConstant: 54),
            
            driverPhoneIcon.heightAnchor.constraint(equalTo: driverPhoneHolderView.heightAnchor, multiplier: 0.5),
            driverPhoneIcon.widthAnchor.constraint(equalTo: driverPhoneHolderView.widthAnchor, multiplier: 0.5),
            driverPhoneIcon.centerXAnchor.constraint(equalTo: driverPhoneHolderView.centerXAnchor),
            driverPhoneIcon.centerYAnchor.constraint(equalTo: driverPhoneHolderView.centerYAnchor),
            
            driverImage.heightAnchor.constraint(equalToConstant: 60),
            driverImage.widthAnchor.constraint(equalToConstant: 60),
            
            driverImageStackView.bottomAnchor.constraint(equalTo: holderView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            driverImageStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 30),
            driverImageStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -30)
        ])
    }
    
    func reloadWith(_ viewModel: CoffeeShopDeliveryMapViewModel) {
        
        deliveryTitleLabel.text = viewModel.deliveryTitleLabel
        deliveryAddressLabel.text = viewModel.deliveryAdress
        deliveryTimeLabel.text = viewModel.deliveryTime
        deliveredOrderTitle.text = viewModel.deliveredOrderTitle
        deliveredOrderSubtitle.text = viewModel.deliveredOrderSubtitle
        driverIcon.image = viewModel.driverIcon
        driverJob.text = viewModel.driverJob
        driverName.text = viewModel.driverName
        driverPhoneIcon.image = viewModel.driverPhoneIcon
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: URL(string: viewModel.driverProfileImage)!), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.driverImage.image = image
                }
            }
        }

        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = CLLocationCoordinate2D(latitude: viewModel.deliveryLatitude, longitude: viewModel.deliveryLongitude)
        userAnnotation.title = "User"
        
        let driverAnnotation = MKPointAnnotation()
        driverAnnotation.coordinate = CLLocationCoordinate2D(latitude: viewModel.driverLatitude, longitude: viewModel.driverLongitude)
        driverAnnotation.title = "Driver"
        
        mapView.addAnnotations([userAnnotation, driverAnnotation])
        
        let centerLatitude = (viewModel.deliveryLatitude + viewModel.driverLatitude) / 2
        let centerLongitude = (viewModel.deliveryLongitude + viewModel.driverLongitude) / 2
        
        let latitudeDelta = abs(viewModel.deliveryLatitude - viewModel.driverLatitude) * 1.4
        let longitudeDelta = abs(viewModel.deliveryLongitude - viewModel.driverLongitude) * 1.4
        
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(centerLatitude, centerLongitude), span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension CoffeeShopDeliveryMapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let userIdentifier = "userLocation"
        let driverIdentifier = "driverLocation"
        
        if annotation.title == "User" {
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: userIdentifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: userIdentifier)
                view.image = UIImage(named: "location")
                view.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            
            }
            view.canShowCallout = true
            return view
        }
        else if annotation.title == "Driver" {
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: driverIdentifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: driverIdentifier)
                view.image = UIImage(named: "driver")
                view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            }
            view.canShowCallout = true
            return view
        }
        return nil
    }
}


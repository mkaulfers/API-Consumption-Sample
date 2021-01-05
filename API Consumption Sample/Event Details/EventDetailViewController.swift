//
//  EventDetailViewController.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import UIKit

class EventDetailViewController: UIViewController {
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navigationController?.isNavigationBarHidden = false
    }
}

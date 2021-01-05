//
//  EventDetailViewController.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import UIKit
import Kingfisher

class EventDetailViewController: UIViewController {
    //MARK: - Class Properties
    //@IBOutlets
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventCityState: UILabel!
    @IBOutlet weak var favoritedIcon: UIImageView!
    
    //Other Properties
    var event: Event?
    let userDefaults = UserDefaults.standard
    var favoritedEvents = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedEvents = userDefaults.object(forKey: "user_favorites") as? [Int] {
            favoritedEvents = savedEvents
        }
        
        setupViews()
    }
    
    func setupViews() {
        eventImage.layer.cornerRadius = 20
        eventImage.clipsToBounds = true
        
        if let event = event {
            //Favorite Image
            if favoritedEvents.contains(event.id) {
                favoritedIcon.image = UIImage(named: "favorite_full")
            }
            
            //Image Setup
            let imageUrl = URL(string: event.performers.first?.image ??
                                "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg")
            
            eventImage.kf.setImage(with: imageUrl)
            
            //Details
            eventTitle.text = event.title
            eventTime.text = event.readableTime.replacingOccurrences(of: "\n", with: "")
            eventCityState.text = "\(event.venue.city), \(event.venue.state)"
        }
    }
    
    @IBAction func favoriteTapped(_ sender: Any) {
        guard let eventID = event?.id else { return }
        
        if favoritedEvents.contains(eventID) {
            favoritedEvents.removeAll { $0 == eventID }
            favoritedIcon.image = #imageLiteral(resourceName: "favorite_empty")
        } else {
            favoritedEvents.append(eventID)
            favoritedIcon.image = #imageLiteral(resourceName: "favorite_full")
        }
        
        userDefaults.setValue(favoritedEvents, forKey: "user_favorites")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  EventCell.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import UIKit
import Kingfisher

class EventCell: UITableViewCell {
    //MARK: @IBoutlets
    @IBOutlet weak var favoritedImage: UIImageView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventTime: UILabel!

    //MARK: Event
    //Use the event on the cell to manage the data.
    var event: Event?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        eventImage.layer.cornerRadius = 10
        eventImage.clipsToBounds = true
        
        if let event = event {
            let imageURLString = event.performers.first?.image ??
                "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg"
            eventImage.kf.setImage(with: URL(string: imageURLString))
            eventTitle.text = event.title
            eventLocation.text = "\(event.venue.city), \(event.venue.state)"
            eventTime.text = event.readableTime
        }
    }
}

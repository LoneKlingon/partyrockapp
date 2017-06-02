//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Anthony Youbi Sobodker on 2017-05-29.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit

class PartyCellTableViewCell: UITableViewCell {
    @IBOutlet var videoImagePreview: UIImageView!
    
    @IBOutlet var videoTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func UpdateUI(partyRock: PartyRock)
    {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async
        {
            do
            {
              let data = try Data(contentsOf: url)
                DispatchQueue.global().sync
                {
                    self.videoImagePreview.image = UIImage(data: data)
                }
            } catch
            {
                //handle error
            }
        }
        
        
    }

}

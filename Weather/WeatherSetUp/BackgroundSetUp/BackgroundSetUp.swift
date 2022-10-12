//
//  DayTimeSetUp.swift
//  Weather
//
//  Created by Efe on 24.09.2022.
//

import Foundation
import UIKit

final class BackgroundSetUp {
    
    private final let backgroundView : UIImageView
    
    init(_ backgroundView : UIImageView) {
        self.backgroundView = backgroundView
    }
    
    public final func dayTime(_ time : String) {
        
        let seperatingDateAndTime = time.split(separator: ",")
        let firstCharInTime = seperatingDateAndTime[1].split(separator: ":")
        let splitFirstCharInTime = firstCharInTime[0].split(separator: " ").joined()
        let time = Int(splitFirstCharInTime)
       
        if let time = time {
            if(time < 00 && time >= 03) {
                print("it is night")
                backgroundView.image = UIImage(named: "night")
            }
            else if (time >= 04 && time <= 11) {
                print("it is morning")
                backgroundView.image = UIImage(named: "sunrise")
            }
            else if (time >= 12 && time <= 18) {
                print("it is day")
                backgroundView.image = UIImage(named: "day")
            }
            else if (time > 18 && time <= 24) {
                print("it is evening")
                backgroundView.image = UIImage(named: "sunset")
            }
        }
    }
}

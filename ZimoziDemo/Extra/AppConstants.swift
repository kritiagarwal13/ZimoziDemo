//
//  AppConstants.swift
//  ZimoziDemo
//
//  Created by Kriti Agarwal on 23/03/20.
//  Copyright © 2020 Nitish Kumar. All rights reserved.
//

import Foundation
import UIKit


let kSharedUserDefaults         = UserDefaults.standard
let kSharedAppDelegate          = UIApplication.shared.delegate as! AppDelegate
let kLatitude                   = "latitude"
let kLongitude                  = "longitude"
let googleAPIKey                = "AIzaSyD4B9Cm0JcaetuozNzHYvJg7mQEIH33das"

struct AppConstants {
    static let kAppName = "ZimoziDemo"
    static let baseUrl = "https://data.gov.sg/dataset/traffic-images"
}



struct StoryBoardConstants {
    static let kMainStoryBoard = "Main"
}

struct ViewControllerConstants {
    static let kViewController = "ViewController"
    
}

struct UserDefaultKey {
    static let isLogin = "isLogin"
    static let token = "token"
    static let language = "language"
    static let email = "email"
    static let displayname = "displayname"
    static let avatar = "avatar"
    static let dob = "dob"
    static let notifications = "notifications"
    static let visibility = "visibility"
    static let phone = "phone"
    static let countryCode = "countryCode"
    static let userId = "userId"
}

struct DateFormatterConstant{
    static let kdateyyy_MM_dd_Thh_mm_SSS_Z = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let kdatedd_mm_yyyy = "dd-MM-yyyy"
    static let kyyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    static let kyyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
    static let kMMM_d_yyyy = "MMM d, yyyy"
    static let kHHmm = "HH:mm"
    static let kMM_dd_yyyy = "MM/dd/yyyy"
    static let kyyyy_MM_dd = "yyyy-MM-dd"
    static let kdd = "dd"
    static let kMMM = "MMM"
    static let kmm = "MM"
    static let kyyyy = "YYYY"
    static let kMMM_dd_HH_mm = "MMM dd, HH:mm"
    static let kHMMM_dd_yyyy_H_mm_aaa = "MMM dd, yyyy - HH:mm aaa"
    static let kyyyy_MM_dd_HH_mm_Z = "yyyy-MM-dd HH:mm.SSS'Z'"

}

struct NotificationName{
    static let kNotificationReloadPosts = "ReloadPosts"
    static let kNotificationReloadJournals = "ReloadJournals"
    static let kNotificationReloadMeetings = "ReloadMeetings"
    static let kBackground = "Background"
    static let kForeground = "Foreground"
    static let kRefreshConnectStatus = "RefreshConnectStatus"
    static let kNotificationReloadNotifications = "ReloadNotifications"
}


struct K {
    struct FONT{
        static let AvenirHeavy = "Avenir-Heavy"
        static let AvenirMedium = "Avenir-Medium"
        static let FuturaBold = "Futura-Bold"
        static let AvenirLight = "Avenir-Light"
        static let AvenirRoman = "Avenir-Roman"
    }
    
    struct COLOR {
        static let whiteDimColor = UIColor.init(white: 1, alpha: 0.5)
        static let blueColor = UIColor.init(red: 100/255, green: 107/255, blue: 255/255, alpha: 1)
        static let yellowColor = UIColor.init(red:1 , green: 190/255, blue: 101/255, alpha: 1)
        static let grayColor = UIColor.init(red:0 , green: 0, blue: 0, alpha: 0.1)
        static let lemonColor = UIColor.init(red:1 , green: 239/255, blue: 47/255, alpha: 1)
        static let blackBg = UIColor.init(red: 75/255, green: 77/255, blue: 103/255, alpha: 1)
        static let pinkBg = UIColor.init(red: 253/255, green: 30/255, blue: 117/255, alpha: 1)
        static let lightGrayColor = UIColor.init(red: 112/255, green: 112/255, blue: 112/255, alpha: 0.5)
        static let ultraLightGrayColor = UIColor.init(red: 112/255, green: 112/255, blue: 112/255, alpha: 0.3)
        static let darkBlueColor = UIColor.init(red: 71/255, green: 79/255, blue: 112/255, alpha: 1)
        static let brightyellowColor = UIColor.init(red:1 , green: 220/255, blue: 75/255, alpha: 1)
        static let gradientBlueColor = UIColor.init(red:118/255 , green: 124/255, blue: 255/255, alpha: 1)
        static let greenColor = UIColor.init(red:135/255 , green: 217/255, blue: 105/255, alpha: 1)
        static let pinkColor = UIColor.init(red:1 , green: 90/255, blue: 154/255, alpha: 1)
        static let rouge = UIColor(red: 190.0 / 255.0, green: 30.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
        static let palePurple = UIColor(red: 157.0 / 255.0, green: 122.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        static let bluish = UIColor(red: 28.0 / 255.0, green: 117.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
        static let squash = UIColor(red: 247.0 / 255.0, green: 148.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
        static let pigPink = UIColor(red: 236.0 / 255.0, green: 168.0 / 255.0, blue: 170.0 / 255.0, alpha: 1.0)
        static let mediumGreen = UIColor(red: 217.0 / 255.0, green: 255.0 / 255.0, blue: 223.0 / 255.0, alpha: 1.0)
        static let green = UIColor(red: 57.0 / 255.0, green: 181.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        
        static let lightBlue = UIColor(red: 206.0 / 255.0, green: 242.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        static let lightPigPink = UIColor(red: 255.0 / 255.0, green: 226.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
        static let tintBlueColor = UIColor(red: 30/255, green: 72/255, blue: 242/255, alpha: 1.0)
        static let tintGreyColor = UIColor(red: 165/255, green: 173/255, blue: 184/255, alpha: 1.0)
        static let greyBGColor = UIColor(red: 201/255, green: 210/255, blue: 229/255, alpha: 1.0)
        static let lightRedColor = UIColor(red: 255/255, green: 198/255, blue: 180/255, alpha: 1.0)
        static let navyBlueColor = UIColor(red: 70/255, green: 78/255, blue: 131/255, alpha: 1.0)
        static let darkishPinkColor = UIColor(red: 255/255, green: 79/255, blue: 103/255, alpha: 1.0)
        //    static let BACKGROUND_DEFAULT_COLOR = UIColor.fromHex(hexString: "#2196F3")
    }
}

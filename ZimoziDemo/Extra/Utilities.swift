//
//  Utilities.swift
//  ZimoziDemo
//
//  Created by Kriti Agarwal on 23/03/20.
//  Copyright © 2020 Nitish Kumar. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

@available(iOS 10.0, *)
class Utilities {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:StoryBoardConstants.kMainStoryBoard,bundle: Bundle.main)
    }
    
    
    static func baseUrl() -> String {
//        Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL")
        return (Bundle.main.infoDictionary?["API_BASE_URL"] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }
    
    class func pushViewController(fromVC:UIViewController, toVC: UIViewController, identifier: String,storyboard: String)
    {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    class func viewConrollerObject(identifier: String,storyboard: String)-> UIViewController{
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        return vc
    }
    
    class func setLoginController(){
        let vc = Utilities.viewConrollerObject(identifier:ViewControllerConstants.kViewController , storyboard: StoryBoardConstants.kMainStoryBoard) as! ViewController
        vc.hidesBottomBarWhenPushed = true
        AppDelegate.getAppDelegate().navigationController.isNavigationBarHidden = true
        Utilities.changeRootViewController(navigation: AppDelegate.getAppDelegate().navigationController, controller:vc)
    }
    
    class func changeRootViewController(navigation: UINavigationController?,controller:UIViewController?){
        if let navigationController = navigation {
            navigationController.setViewControllers([controller!], animated: true)
        }
    }
    
    class func getStoryBoard(name:String)-> UIStoryboard{
        let storyboard = UIStoryboard(name: name, bundle:Bundle.main)
        return storyboard
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func showInformationAlert(title: String, message: String) {
        let alert = AlertBuilder()
            .setTitle(title)
            .setMessage(message)
            .addButton("Ok")
            .build()
        Utilities.topViewController()?.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(title: String, message: String, buttons: [String : (() -> Void)?]) {
        
        let alert = AlertBuilder()
            .setTitle(title)
            .setMessage(message)
            .addButtons(buttons: buttons)
            .build()
        
        Utilities.topViewController()?.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    class func formatDate(fromdateformat: String, fromdate:String, todateformat:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromdateformat
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = todateformat
        dateFormatter.locale = Locale.current
        let dateObj: Date? = dateFormatterGet.date(from: fromdate)
        return dateFormatter.string(from: dateObj ?? Date())
    }
    
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func toUTCString( dateFormat format  : String ) -> String
       {
           let dateFormatter = DateFormatter()
           dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
          dateFormatter.dateFormat = format
           return dateFormatter.string(from: self)
       }

    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
        // or use capitalized(with: locale) if you want
    }
    
    func isEqualTo(_ date: Date) -> Bool {
       return self == date
     }

     func isGreaterThan(_ date: Date) -> Bool {
        return self > date
     }

     func isSmallerThan(_ date: Date) -> Bool {
        return self < date
     }
    
    var monthAndYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        return dateFormatter.string(from: self)
    }
    var dateAndMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: self)
    }
    
    var new_month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var new_year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Double {
    func toInt() -> Int? {
        let minInt = Double(Int.min)
        let maxInt = Double(Int.max)

        guard case minInt ... maxInt = self else {
            return nil
        }

        return Int(self)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

# Custom-Loader-Alert-Controller

## Custom Loading View Inside Alert Controller With Message.


Added Some screens here.

![](https://github.com/pawankv89/Custom-Loader-Alert-Controller/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/Custom-Loader-Alert-Controller/blob/master/images/screen_2.png)

## Usage


#### Controller

``` swift 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
       @IBAction func showLoader(_ sender: UIButton) {
        
            UICustomAlertController.shared.displayActivityIndicatorAlert(message: "Loading")
            //UICustomAlertController.shared.displayActivityIndicatorAlert(message: "")
            //UICustomAlertController.shared.displayActivityIndicatorAlert(message: nil)
       }

}

``` 

#### Controller

``` swift 

import UIKit

class UICustomAlertController: NSObject {
    //Step I
    var activityIndicatorAlert: UIAlertController?
    
    static let shared = UICustomAlertController()
      
      //Constructor
      private override init() {
          super.init()
      }

    func displayActivityIndicatorAlert(message: String?) {
        
        activityIndicatorAlert = UIAlertController(title: nil, message: nil, preferredStyle:  UIAlertController.Style.alert)
        activityIndicatorAlert!.addActivityIndicator(message: message)
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while ((topController.presentedViewController) != nil) {
            topController = topController.presentedViewController!
        }
        topController.present(activityIndicatorAlert!, animated:true, completion:nil)
    }

    func dismissActivityIndicatorAlert() {
        activityIndicatorAlert!.dismissActivityIndicator()
        activityIndicatorAlert = nil
    }
}

//Step II
extension UIAlertController {

    private struct ActivityIndicatorData {
        static var activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 10, width: 80, height: 80))
    }

    func addActivityIndicator(message: String?) {
        
        //Crreate ViewController
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 280,height: 100)
        //vc.view.backgroundColor = .red
       
        //Add ActivityIdicator
        
        ActivityIndicatorData.activityIndicator.color = .black
        ActivityIndicatorData.activityIndicator.startAnimating()
         if #available(iOS 13.0, *) {
                   ActivityIndicatorData.activityIndicator.style = .large
            print("large")
               } else {
                   // Fallback on earlier versions
                   ActivityIndicatorData.activityIndicator.style = .gray
            print("gray")
               }
        vc.view.addSubview(ActivityIndicatorData.activityIndicator)
        
        //Add Label
        let lbl = UILabel(frame: CGRect(x: 70, y: 10, width: 190, height: 80))
        lbl.textAlignment = .left //For center alignment
        
        if message == nil {
              lbl.text = "Loading..."
        }
        else if message?.count == 0 {
            lbl.text = "Loading..."
        }else {
             lbl.text = message
        }
    
        lbl.textColor = .black
        //lbl.backgroundColor = .lightGray//If required
        lbl.font = UIFont.systemFont(ofSize: 20)

        //To display multiple lines in label
        lbl.numberOfLines = 0 //If you want to display only 2 lines replace 0(Zero) with 2.
        lbl.lineBreakMode = .byWordWrapping //Word Wrap
        // OR
        //lbl.lineBreakMode = .byCharWrapping //Charactor Wrap

        //lbl.sizeToFit()//If required
        vc.view.addSubview(lbl)
        
        //Add ViewCotroller
        self.setValue(vc, forKey: "contentViewController")
    }

    func dismissActivityIndicator() {
        ActivityIndicatorData.activityIndicator.stopAnimating()
        self.dismiss(animated: false)
    }
}


``` 

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 


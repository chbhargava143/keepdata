//
//  entryDataVc.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//

import UIKit
protocol reloadTbl {
    func refreshTbl()
}
class entryDataVc: UIViewController ,UITextViewDelegate{
    var delegate : reloadTbl?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var height_View: NSLayoutConstraint!
    @IBOutlet weak var bcView:UIView!
    @IBOutlet weak var dimissView : UIView!
    @IBOutlet weak var dataTextView : UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       corners()
        bcView.layer.backgroundColor = UIColor.clear.cgColor
        dimissView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        if UIScreen.main.bounds.height < 600 {
            height_View.constant = 250
        }
        else if UIScreen.main.bounds.height > 700{
            height_View.constant = 450
        }
       else if UIDevice.current.orientation.isLandscape{
            height_View.constant = 100
        }
        dataTextView.textContainerInset = UIEdgeInsets(top: 20 , left: 20, bottom: 10, right: 20)
        //Looks for single or multiple taps.
        self.hideKeyboardWhenTappedAround()
     
        dataTextView.delegate = self
                // Do any additional setup after loading the view.
    }
    // MARK: - Make Two side round corners to TextView.
    func corners(){
       
        //dataTextView.clipsToBounds = true
        dataTextView.layer.cornerRadius = 20
        dataTextView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
    }
    // MARK: - Hide keyboard when we tapped on return key in keyboard.
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            dataTextView.resignFirstResponder()
            return false
        }
        return true
    }

//    func textViewShouldReturn(textView: UITextView!) -> Bool {
//           self.view.endEditing(true)
//           return true
//       }
  
    override func viewWillAppear(_ animated: Bool) {
           self.addKeyboardObserver()
       }

       override func viewWillDisappear(_ animated: Bool) {
           self.removeKeyboardObserver()
       }

    // MARK: - Insert data to Coredata.
    func insertData(name : String,date : Date){
        
        
        let newItem = Notedata(context: context)
        newItem.createdata = name
        
        newItem.createdate = date
        
        do{
            try context.save()
        }
        catch{
            print("error")
        }
    }
    @IBAction func didTapDismiss(_ sender : UIBarButtonItem){
        let date = Date()
        
        
        if let dataText = dataTextView.text {
            if dataText != nil,!dataText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
                    self.insertData(name: dataText, date: date)
                
            }
         
        }
        delegate?.refreshTbl()
        self.dismiss(animated: true, completion: nil)
    }

}


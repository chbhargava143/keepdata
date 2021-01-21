//
//  ViewController.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//

import UIKit
import CoreData
class ViewController: UIViewController ,reloadTbl{
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [Notedata]()
    @IBOutlet weak var tbl_View : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addNibFile()
       delegates()
        getAllItems()
       
        // Do any additional setup after loading the view.
    }
    // MARK: - Tableview datasource and delegates.
    func delegates(){
        tbl_View.delegate = self
        tbl_View.dataSource = self
        self.tbl_View.separatorStyle = .none
    }
    // MARK: - This to add cell to tableview.
    func addNibFile(){
        let nibName = UINib.init(nibName: "dataCell", bundle: nil)
        self.tbl_View.register(nibName, forCellReuseIdentifier: "dataCell")
    }
    @IBAction func didTapPresent(_ sender : UIBarButtonItem){
        presentEntryVc()
    }
    // MARK: - Present text enter vc.
    func presentEntryVc(){
        let presentEntryVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "entryDataVc") as! entryDataVc
        presentEntryVc.delegate = self
        presentEntryVc.modalTransitionStyle = .coverVertical
        presentEntryVc.modalPresentationStyle = .custom
        self.present(presentEntryVc, animated: true, completion: nil)
    }
    func refreshTbl() {
       relodtableView()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_View.dequeueReusableCell(withIdentifier: "dataCell") as! dataCell
        let items = models[indexPath.row]
        cell.rowLabel.text = String(indexPath.row+1)
        cell.dataLabel.text = items.createdata
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "E,d MM yyyy,HH:mm:ss a"
      
       
        if let dates = items.createdate{
           
            let dateString = formatter.string(from: dates)
            cell.dateLabel.text = dateString
            //print(dateString)
        }
      
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    // Set the spacing between sections
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10
//    }
    
    // Make the background color show through
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.clear
//
//        return headerView
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let items = models[indexPath.row]
        let alert = UIAlertController.init(title: "Edit", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "View", style: .default, handler: { (_) in
            let detailslVc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "detailVc") as! detailVc
            detailslVc.getData = items
            self.navigationController?.pushViewController(detailslVc, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Edit", style: .default, handler: { (_) in
            let sheet = UIAlertController.init(title: "Edit Item", message: "Edit your Item", preferredStyle: .alert)
            
            sheet.addTextField(configurationHandler: nil)
            sheet.textFields?.first?.text = items.createdata
            sheet.addAction(UIAlertAction.init(title: "Save", style: .default, handler: { [weak self] _ in
                guard let field = sheet.textFields?.first, let newItem = field.text, !newItem.isEmpty else{
                    return
                }
                self?.updateData(item: items, newName: newItem)
                self?.relodtableView()
            }))
            self.present(sheet, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction.init(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.deletetData(item: items)
            self?.relodtableView()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
            }
    // MARK: - Reload tableview using delegate method.
    func relodtableView(){
        DispatchQueue.main.async {
            self.getAllItems()
            self.tbl_View.reloadData()
        }
    }
}


extension ViewController {
    // MARK: - Get all items from Coredata.
    func getAllItems(){
        do{
            self.models = try context.fetch(Notedata.fetchRequest())
            DispatchQueue.main.async {
                self.tbl_View.reloadData()
            }
        }catch{
            
        }
    }
    // MARK: - Update selected item in Taleview.
    func updateData(item:Notedata,newName:String){
        
        item.createdata = newName
        do{
            try context.save()
        }
        catch{
            print("error")
        }

    }
    // MARK: - Delete selected item in Tableview.
    func deletetData(item:Notedata){
        context.delete(item)
        do{
            try context.save()
        }
        catch{
            print("error")
        }

    }
}

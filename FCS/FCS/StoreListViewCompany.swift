//
//  StoreListViewCompany.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/30/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class StoreListTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    
    override func awakeFromNib() {
        storeImageView.layer.borderWidth = 1
        storeImageView.layer.masksToBounds = false
        storeImageView.layer.borderColor = UIColor.white.cgColor
        storeImageView.layer.cornerRadius = storeImageView.frame.height/2
        storeImageView.clipsToBounds = true
    }
}

class StoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var backBtn: UIBarButtonItem!

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.storeTableView.delegate = self
        self.storeTableView.dataSource = self
        
        backBtn.accessibilityLabel = "bbtn"
        searchBar.accessibilityLabel = "sb"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeListTableViewCell", for: indexPath)
            as! StoreListTableViewCell
       cell.storeNameLabel.text = "BBC Company"
        cell.storeDescription.text = "108 Trần Minh Quyền, P11, Q10"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChecklistsTableViewController()
        vc.modalPresentationCapturesStatusBarAppearance = true

        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

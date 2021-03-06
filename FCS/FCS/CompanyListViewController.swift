//
//  CompanyListViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/29/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class CompanyListTableViewCell: UITableViewCell {
    @IBOutlet weak var companyImageView: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyDescription: UILabel!
    
    override func awakeFromNib() {
        companyImageView.layer.borderWidth = 1
        companyImageView.layer.masksToBounds = false
        companyImageView.layer.borderColor = UIColor.white.cgColor
        companyImageView.layer.cornerRadius = companyImageView.frame.height/2
        companyImageView.clipsToBounds = true
    }
}

class CompanyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var companyTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.companyTableView.delegate = self
        self.companyTableView.dataSource = self
        backButton.accessibilityLabel = "bbtn"
        searchBar.accessibilityLabel = "sb"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyListTableViewCell", for: indexPath)
            as! CompanyListTableViewCell
        cell.companyNameLabel.text = "HighLand Coffee"
        cell.companyDescription.text = "Highlands Coffee® được sinh ra từ niềm đam mê bất tận với hạt cà phê Việt Nam"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreListViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}

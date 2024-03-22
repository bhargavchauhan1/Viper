//
//  DashboardVC.swift
//  Shahen-VIPER
//
//  Created by Sunny Patel on 19/03/24.
//

import UIKit

class DashboardVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var dashBoardTableView: UITableView!
    @IBOutlet weak var profilePictureImg: UIImageView!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var alertsImg: UIImageView!
    
//    MARK: Variables
//    var sections : [HomeTableSections] = [.grid, .newOrders,.salesReport, .currentOrders]
    
    var homeTableArr = [
        HomeTableUI(name: "Grid", section: .grid),
        HomeTableUI(name: "New Orders", section: .newOrders),
        HomeTableUI(name: "Sales Report", section: .salesReport),
        HomeTableUI(name: "Current orders", section: .currentOrders)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        welcomeLbl.text = "Welcome"
        usernameLbl.text = "User Name"
        dashBoardTableView.delegate = self
        dashBoardTableView.dataSource = self
        makeImageViewRounded()
        registerTableCells()
    }
    
    func makeImageViewRounded() {
        profilePictureImg.layer.masksToBounds = true
        profilePictureImg.layer.cornerRadius = profilePictureImg.frame.height/2
    }
    
    func registerTableCells(){
        dashBoardTableView.register(UINib(nibName: "HomeGridViewCell", bundle: nil), forCellReuseIdentifier: "HomeGridViewCell")
        dashBoardTableView.register(UINib(nibName: "NewOrderCell", bundle: nil), forCellReuseIdentifier: "NewOrderCell")
        dashBoardTableView.register(UINib(nibName: "CurrentOrdersCell", bundle: nil), forCellReuseIdentifier: "CurrentOrdersCell")
        
        
    }
    
}

//MARK: UItableview delegate and datasource
extension DashboardVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeTableArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch homeTableArr[section].section{
        case .grid:
            return ""
        case .newOrders:
            return homeTableArr[section].name
        case .salesReport:
            return homeTableArr[section].name
        case .currentOrders:
            return homeTableArr[section].name
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch homeTableArr[section].section{
        case .grid:
            1
        case .newOrders:
            2
        case .salesReport:
            1
        case .currentOrders:
            2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = homeTableArr[indexPath.section].section
        switch section {
        case .grid:
            return getHomeGridCell(indexPath: indexPath)
        case .newOrders:
            return getNewOrderCell(indexPath: indexPath)
        case .salesReport:
            let cell = UITableViewCell()
            cell.textLabel?.text = "salesReport"
            return cell
        case .currentOrders:
            return getCurrentOrderCell(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


//MARK: Table view cells
extension DashboardVC{
    
    func getHomeGridCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = dashBoardTableView.dequeueReusableCell(withIdentifier: "HomeGridViewCell", for: indexPath) as! HomeGridViewCell
        return cell
    }
    
    func getNewOrderCell(indexPath: IndexPath) -> UITableViewCell{
        let cell = dashBoardTableView.dequeueReusableCell(withIdentifier: "NewOrderCell", for: indexPath) as! NewOrderCell
        return cell
    }
    
    func getCurrentOrderCell(indexPath: IndexPath) -> UITableViewCell{
        let cell = dashBoardTableView.dequeueReusableCell(withIdentifier: "CurrentOrdersCell", for: indexPath) as! CurrentOrdersCell
        return cell
    }
    
}

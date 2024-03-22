//
//  HomeGridViewCell.swift
//  Shahen-VIPER
//
//  Created by Sunny Patel on 19/03/24.
//

import UIKit

class HomeGridViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var collectionArr = [CollectionUI(title: "Direct Orders", item: .directOrder),
                         CollectionUI(title: "Special Orders", item: .specialOrder),
                         CollectionUI(title: "Offers", item: .offer),
                         CollectionUI(title: "Contracts", item: .contracts),
                         CollectionUI(title: "Driver", item: .driver),
                         CollectionUI(title: "Trucks", item: .trucks)
    
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }
    
    func setupCell(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GridViewCell", bundle: nil), forCellWithReuseIdentifier: "GridViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HomeGridViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridViewCell", for: indexPath) as! GridViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        switch collectionArr[indexPath.row].item {
            
        case .directOrder:
            cell.gridImage.image = UIImage(named: "DirectOrders")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        case .specialOrder:
            cell.gridImage.image = UIImage(named: "SpecialOrders")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        case .offer:
            cell.gridImage.image = UIImage(named: "Orders")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        case .contracts:
            cell.gridImage.image = UIImage(named: "Contracts")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        case .driver:
            cell.gridImage.image = UIImage(named: "Driver")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        case .trucks:
            cell.gridImage.image = UIImage(named: "Trucks")
            cell.gridTitle.text = collectionArr[indexPath.row].title
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 10, height: collectionView.frame.height/2 - 20 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    
    
    
}

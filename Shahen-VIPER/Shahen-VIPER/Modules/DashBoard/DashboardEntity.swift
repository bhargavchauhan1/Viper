//
//  DashboardEntity.swift
//  Shahen-VIPER
//
//  Created by Sunny Patel on 19/03/24.
//

import Foundation


enum HomeTableSections{
    case grid
    case newOrders
    case salesReport
    case currentOrders
}

struct HomeTableUI{
    var name: String
    var section : HomeTableSections
}

struct CollectionUI{
    var title: String
    var item : CollectionItem
}

enum CollectionItem{
    case directOrder
    case specialOrder
    case offer
    case contracts
    case driver
    case trucks
}






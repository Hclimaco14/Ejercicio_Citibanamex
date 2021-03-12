//
//  Coordinator.swift
//  Citibanamex
//
//  Created by Hector Climaco on 10/03/21.
//


import UIKit

protocol Coordinator:AnyObject {
    var navigationController:UINavigationController { get set }
    var childCoordinators:[Coordinator] { get set }
    func start()
}


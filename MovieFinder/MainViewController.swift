//
//  MainViewController.swift
//  MovieFinder
//
//  Created by Kyungmo on 2019/09/29.
//  Copyright © 2019 Kyungmo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Movie Finder"
    }
}

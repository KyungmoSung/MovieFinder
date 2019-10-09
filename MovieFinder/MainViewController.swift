//
//  MainViewController.swift
//  MovieFinder
//
//  Created by Kyungmo on 2019/09/29.
//  Copyright © 2019 Kyungmo. All rights reserved.
//

import RxSwift
import RxCocoa
import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet var popularCollectionView: UICollectionView!
    var network = MFNetworkManager()
    var disposeBag = DisposeBag()

    let popularSubject = BehaviorSubject<[Movie]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Movie Finder"
        
        let flowLayout = UICollectionViewFlowLayout()
        let height = popularCollectionView.frame.size.height
        let width = height * 0.5
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: width, height: height)
        popularCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        popularCollectionView.register(UINib(nibName: PopularCell.cellID, bundle: nil), forCellWithReuseIdentifier: PopularCell.cellID)
        
        network.getPopular()
            .subscribe( onSuccess: { movies in
                self.popularSubject.onNext(movies)
            }, onError: { err in
                print(err.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        popularSubject
            .bind(to: popularCollectionView.rx.items(cellIdentifier: PopularCell.cellID, cellType: PopularCell.self)){index,item,cell in
                cell.titleLb.text = item.title
                if let posterPath = item.posterPath, let posterUrl = URL(string: AppURL.Tmdb.image + posterPath) {
                    cell.posterIv.kf.setImage(with: posterUrl)
                }
        }
        .disposed(by: disposeBag)
    }
}

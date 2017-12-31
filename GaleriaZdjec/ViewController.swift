//
//  ViewController.swift
//  GaleriaZdjec
//
//  Created by Krzysztof Hadas on 07.12.2017.
//  Copyright © 2017 krzysztofhadas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ileKomorekPoziomo: CGFloat = 2
        let ileKomorekPionowo: CGFloat = 4
        let width = (UIScreen.main.bounds.size.width / ileKomorekPoziomo) - 15
        let height = (UIScreen.main.bounds.size.height / ileKomorekPionowo) - 15
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tablicaNazwZdjec.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "drugiViewController", sender: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "komorka", for: indexPath) as? Komorka{
            cell.imageView.image = UIImage.init(named: tablicaNazwZdjec[indexPath.row])
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drugiViewController" {
            if let duzyObrazek = segue.destination as? DrugiViewController {
                if let zdjecie = sender as? Int {
                    duzyObrazek.nrWybranegoZdjecia = zdjecie
                }
            }
        }
    }
    
}


//
//  DrugiViewController.swift
//  GaleriaZdjec
//
//  Created by Krzysztof Hadas on 10.12.2017.
//  Copyright © 2017 krzysztofhadas. All rights reserved.
//

import UIKit

class DrugiViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var szerokoscScrollView: CGFloat = 0.0
    var nrWybranegoZdjecia: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var szerokoscScrollView: CGFloat = 0.0
        
        let szerokoscEkranu = view.frame.width
        let wysokoscEkranu = view.frame.height
        
        
        for zdjecie in 0...(tablicaNazwZdjec.count-1) {
            //stworzenie zdjęcia
            let zdjecieDoWyswietlenia = UIImage.init(named:tablicaNazwZdjec[zdjecie])
            
            //stworzenie image view
            let imageView = UIImageView(image: zdjecieDoWyswietlenia)
            
            //wymiary image view
            let szerZdjecia = szerokoscEkranu - 20
            let wysZdjecia = wysokoscEkranu - 200
            
            //aspect fit nie przytnie ani nie zdeformuje obrazka
            imageView.contentMode = .scaleAspectFit
            
            //zdefiniowanie wspolrzednej x dla kazdego zdjecia
            //dla pierwszego zdjecia fragment szerokoscEkranu * CGFloat(zdjecie) wyniesie 0,
            //dla kazdego kolejnego wyniesie kolejna szerokosc ekranu, o ktora ma ono byc przesuniete
            let wspolrzednaX = view.frame.midX + szerokoscEkranu * CGFloat(zdjecie)
            
            //przypisanie wszystkich zdefiniowanych wyzej wartosci do ramki image view
            imageView.frame = CGRect(x: wspolrzednaX - szerZdjecia / 2, y: (wysokoscEkranu / 2) - wysZdjecia/2 , width: szerZdjecia, height: wysZdjecia)
            
            //dodanie zdjęcia do scroll view
            scrollView.addSubview(imageView)
            szerokoscScrollView += szerokoscEkranu
        }
        scrollView.contentSize = CGSize(width: szerokoscScrollView, height: wysokoscEkranu)
        scrollView.contentOffset = CGPoint(x: CGFloat(szerokoscEkranu * CGFloat(self.nrWybranegoZdjecia)), y: 0)
        scrollView.alpha = 0.0
    }

    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.scrollView.alpha = 1.0
        }, completion: nil)
    }
    
    
    @IBAction func guzikWcisniety(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

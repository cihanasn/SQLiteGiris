//
//  ViewController.swift
//  SQLiteGiris
//
//  Created by Cihan AŞAN on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        veritabaniKopyala()
        
        //KisilerDao().kisiEkle(kisi_adi: "Cihan", kisi_yas: 38)
        //KisilerDao().kisiEkle(kisi_adi: "Cihan", kisi_yas: 38)
        //KisilerDao().kisiEkle(kisi_adi: "Mustafa", kisi_yas: 72)
        //KisilerDao().kisiEkle(kisi_adi: "Fatma", kisi_yas: 57)
        
        //KisilerDao().kisiSil(kisi_id: 3)
        
        //KisilerDao().kisiGuncelle(kisi_id: 4, kisi_adi: "Gökhan", kisi_yas: 42)
        
        let sonuc = KisilerDao().kisiKontrol(kisi_adi: "Gökhan")
        
        print("Sonuç : \(sonuc)")
        
        let liste = KisilerDao().tümKisilerAl()
        
        for kisi in liste {
            print("ID: \(kisi.kisi_id!) - Adı: \(kisi.kisi_adi!) - Yaş: \(kisi.kisi_yas!)")
        }
        
    }
    
    func veritabaniKopyala() {
        
        let bundleYolu = Bundle.main.path(forResource: "kisilerGiris", ofType: ".sqlite")
        
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYolu).appendingPathComponent("kisilerGiris.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var. Kopyalamaya gerek yoktur.")
        }else {
            
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch {
                print(error)
            }
            
        }
        
    }
    
}


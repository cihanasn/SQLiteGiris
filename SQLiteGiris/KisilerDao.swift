//
//  KisilerDao.swift
//  SQLiteGiris
//
//  Created by Cihan AŞAN on 22.09.2024.
//

import Foundation

class KisilerDao {
    
    let db:FMDatabase?
    
    init() {
        let hedefYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefYolu).appendingPathComponent("kisilerGiris.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
        
    }
    
    func kisiEkle(kisi_adi:String, kisi_yas:Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_adi, kisi_yas) VALUES (?, ?)", values: [kisi_adi, kisi_yas])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func kisiGuncelle(kisi_id:Int, kisi_adi:String, kisi_yas:Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_adi = ?, kisi_yas = ? WHERE kisi_id = ?", values: [kisi_adi, kisi_yas, kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func kisiSil(kisi_id:Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func tümKisilerAl() -> [Kisiler] {
        var liste = [Kisiler]()
        
        db?.open()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!, kisi_adi: result.string(forColumn: "kisi_adi")!, kisi_yas: Int(result.string(forColumn: "kisi_yas"))!)
                
                liste.append(kisi)
                
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
        
    }
    
}

//
//  ViewController.swift
//  CosLapCellTabLeView
//
//  Created by Boss on 12/21/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mytableView: UITableView!
    
     var tieude = ["gggg", "Cua Hang"]
    
    var noidung = [["A1", "A2"],
                   ["Tap Hoa", "Hang Game"]
    ]
    var disPlayNoidung: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disPlayNoidung = noidung
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tieude.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disPlayNoidung[section].count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // khi ma indexPath.row = 0 thi se su dung tieude
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? TableViewCell1
            cell1?.titleName.text = tieude[indexPath.section]
            return cell1!
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? TableViewCell2
            cell2?.titleNames.text = disPlayNoidung[indexPath.section][indexPath.row - 1]
            return cell2!
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {return}
        // neu rong thi them moi
        if disPlayNoidung[indexPath.section].isEmpty {
            let indexSet = [Int](1...noidung[indexPath.section].count).map {
                IndexPath(row: $0, section: indexPath.section)
            }
            disPlayNoidung[indexPath.section] = noidung[indexPath.section]
            tableView.insertRows(at: indexSet, with: .top)
        }else {
            // tao 1 index tu 1 den count ( dem so thang con cua section)
            // chuyen tu int sang indexPath dung map
            let indexSet = [Int](1...noidung[indexPath.section].count).map {
                IndexPath(row: $0, section: indexPath.section)
            }
            disPlayNoidung[indexPath.section] = []
            tableView.deleteRows(at: indexSet, with: .top)
        }

    }
}


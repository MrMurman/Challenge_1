//
//  ViewController.swift
//  Challenge_1
//
//  Created by Андрей Бородкин on 26.06.2021.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    let cellSpacingHeight: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            if item.hasSuffix(".jpg") {
//                flags.append(item)
//            }
//        }
       flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        print(flags)
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row].uppercased()
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        cell.imageView?.layer.borderWidth = 1
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            //vc.detailVCTitle = flags[indexPath.row].uppercased()
        }
    }
}


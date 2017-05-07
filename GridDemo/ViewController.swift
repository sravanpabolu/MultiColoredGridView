//
//  ViewController.swift
//  GridDemo
//
//  Created by Sravan on 14/04/17.
//  Copyright © 2017 Sravan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtRows: UITextField!
    @IBOutlet weak var tctColumn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSubmitTapped(sender: Any) {
        var rows: Int = 1
        var col: Int = 1
        
        if let row = txtRows.text {
            rows = Int( row )!
        }
        
        if let columnValue = tctColumn.text {
            col = Int (columnValue)!
        }
        
        let validationSuccess:Bool = validateTxtFields(rows: rows, Column: col)
        
        if validationSuccess == true {
//            drawGrid(rows: rows, Column: col)
            
            CollectionViewController.rowCount = rows
            CollectionViewController.columnCount = col
        }
    }
    
    func validateTxtFields(rows: Int, Column:Int) -> Bool {
        if rows > 0, Column > 0 {
            return true
        }
        return false
    }

    func drawGrid(rows: Int, Column: Int) {
        
        for _ in 1...rows {
            print("X")
            for _ in 1...Column {
                print("|")
            }
            
        }
    }
 

}



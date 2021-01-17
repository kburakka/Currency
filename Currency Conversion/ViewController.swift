//
//  ViewController.swift
//  Currency Conversion
//
//  Created by Burak Kaya on 17.01.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var euroMiktari: UILabel!
    @IBOutlet weak var dolarMiktari: UILabel!
    @IBOutlet weak var tlMiktari: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cevirButonAction(_ sender: Any) {
        AF.request("https://api.exchangeratesapi.io/latest?base=TRY").response { [self] response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Currency.self, from: data)
                let tl = Double(tlMiktari.text ?? "0")!
                let euro = model.rates.eur  * tl
                let dolar = model.rates.usd * tl
                let roundedEuro = Double(round(1000*euro)/1000)
                let roundedDolar = Double(round(1000*dolar)/1000)

                self.euroMiktari.text = "\(roundedEuro)"
                self.dolarMiktari.text = "\(roundedDolar)"
            } catch let error {
                print(error)
            }
        }
    }
}


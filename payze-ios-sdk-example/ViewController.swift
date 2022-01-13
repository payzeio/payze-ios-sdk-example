//
//  ViewController.swift
//  payze-ios-sdk-example
//
//  Created by Bakur Khalvashi on 13.01.22.
//

import UIKit
import Payze_iOS_sdk

class ViewController: UIViewController {
    
    @IBOutlet private weak var cardNumberTxtField: UITextField!
    @IBOutlet private weak var cardHolderTxtField: UITextField!
    @IBOutlet private weak var cvvTxtField: UITextField!
    @IBOutlet private weak var monthTxtField: UITextField!
    @IBOutlet private weak var yearTxtField: UITextField!
    @IBOutlet private weak var transactionIDTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func makeExpirationDate(s1: String?, s2: String?) -> String {
        guard let s1 = s1 else { return ""}
        guard let s2 = s2 else { return ""}
        return s1 + "/" + s2
    }
    @IBAction func makePayment(_ sender: Any) {
        guard let paymentDetails = PaymentDetails.init(number: cardNumberTxtField.text, cardHolder: cardHolderTxtField.text, expirationDate: makeExpirationDate(s1: monthTxtField.text, s2: yearTxtField.text), securityNumber: cvvTxtField.text, transactionId: transactionIDTxtField.text, billingAddress: PaymentDetails.defaultBillingAddress) else { return }
        
        PaymentService.shared.startPayment(paymentDetails: paymentDetails) { result in
            print(result)
        }
    }
    
    deinit {
        print("View Controller deinited")
    }
    
}


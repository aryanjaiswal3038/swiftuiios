//
//  CardView.swift
//  PayUCheckoutProWithSwiftUI
//
//  Created by Rishabh Jaiswal on 08/01/24.
//

import SwiftUI
import PayU3DS2Kit
import UIKit


struct CardView: View {
    
    @State private var tab = 0
    @State var cardName = ""
    @State var cardNumber = ""
    @State var cardExpiry = ""
    @State var cvv = ""
    @State var cardToken = ""
    @State var networkToken = ""
    @State var month1 = ""
    @State var year1 = ""
    @State private var selectedDate = Date()
    @State private var isDatePickerShown = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var key: String
    @Binding var salt: String
    @Binding var txnId: String
    @Binding var amount: String
    @Binding var email: String
    @Binding var userCredentials: String
    @Binding var phone1: String
    @ObservedObject var delegate = PayUCheckoutProDelegateClass(salt: "g0nGFe03")
    @Binding var config: PayU3DS2Config
    
    
    init(key: Binding<String>,salt: Binding<String>,txnId: Binding<String>,amount: Binding<String>,email: Binding<String>,userCredentials: Binding<String>,phone1: Binding<String>, config: Binding<PayU3DS2Config> ){
        _key = key
        _salt = salt
        _txnId = txnId
        _amount = amount
        _email = email
        _userCredentials = userCredentials
        _phone1 = phone1
        _config = config
        UISegmentedControl.appearance().selectedSegmentTintColor = .init(red: 0/255, green: 117/255, blue: 227/255, alpha: 1)
        UISegmentedControl.appearance().frame.size.height = 50
        
    }
    
    var body: some View {

        VStack{

            HStack{
                Spacer()
                Button(action: {
                    // openCheckoutPro()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                }
                .foregroundColor(.blue)
                .padding()
            }
        }
        Spacer()
                // both buttons in a HStack so that they appear in a single row
        VStack {
            
            
                  Picker("", selection: $tab) {
                      Text("Add NEW CARD").tag(0)
                      Text("SELECT SAVED CARDS").tag(1)
                  }
                  .frame(height: 50)
                  .scaleEffect(CGSize(width: 1.1, height: 1.1))
                  .pickerStyle(SegmentedPickerStyle())
                  .scaledToFit()
                   Spacer()

            if tab == 0{
                
                
                VStack(){
                    
                    HStack{
                        Text("Card Name")
                        Spacer()
                        TextField("Card Name", text: $cardName)
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
            
                }
                    .padding(.horizontal, 20)
                    
                    HStack{
                        Text("Card Number")
                        Spacer()
                        TextField("Card Number", text: $cardNumber)
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                        
                    }
                    .padding(.horizontal, 20)
                
                    HStack{
                        Text("Card Expiry(mm/yyy)")
                        Spacer()
                        TextField("MM/YYYY", text: $cardExpiry, onEditingChanged: { _ in
                            // Optional: You can add validation logic here
                            extractValues()
                        }, onCommit: {
                            extractValues()
                        })
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                            .onChange(of: cardExpiry) { newValue in
                                // Ensure that the text follows the "MM/YYYY" format
                                if newValue.count == 2 && !newValue.contains("/") {
                                    cardExpiry += "/"
                                } else if newValue.count > 7 {
                                    // Limit the total characters
                                    cardExpiry = String(newValue.prefix(7))
                                }
                            }
                  
                    }
                    .padding(.horizontal, 20)
                    
                    HStack{
                        Text("CVV")
                        Spacer()
                        TextField("CVV", text: $cvv)
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    HStack{
                        Text("Card Token")
                        Spacer()
                        TextField("Card Token", text: $cardToken)
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                        
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    
                    HStack{
                        Text("Network Token")
                        Spacer()
                        TextField("Network Token", text: $networkToken)
                            .frame(width: KscreenWidth/2, height: 45)
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .frame(maxWidth: 200)
                        
                        
                    }
                    .padding(.horizontal, 20)
                
                }
                Spacer()
                .padding(.trailing, 25)
                
            }
            else if tab == 1 {
                
                Text("Save Card Feature is in Progress").bold()
                  Spacer()
            }
            
                  
              }
                  Spacer()
        

        Button(action: {
            hideKeyboard()
            openCheckoutPro()
        }) {
            Text("Pay Now")
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .frame(width: KscreenWidth, height: 50)
                .background(Rectangle().fill(Color.blue).shadow(radius: 3))
        }
       
    }
    func extractValues() {
        if let (month, year) = extractMonthAndYear(from: cardExpiry) {
            month1 = month
            year1 = year
            print("Month: \(month), Year: \(year)")
        } else {
            print("Invalid input format")
        }
    }
    
  func extractMonthAndYear(from input: String) -> (String, String)? {
        let components = input.components(separatedBy: "/")

        guard components.count == 2, let month = components.first, let year = components.last else {
            return nil
        }

        return (month, year)
    }
    private func getUserDetailsDict() -> [String: Any] {
        var dict = [String: Any]()
        dict[SampleAppConstants.amount] = amount
        dict[SampleAppConstants.key] = key
        dict[SampleAppConstants.salt] = salt
        dict[SampleAppConstants.email] = email
        dict[SampleAppConstants.cardNumber] = cardNumber
        dict[SampleAppConstants.cardExpiryMonth] = month1
        dict[SampleAppConstants.cardExpiryYear] = year1
        dict[SampleAppConstants.cardName] = cardName
        dict[SampleAppConstants.cvv] = cvv
        dict[SampleAppConstants.transactionId] = txnId
        return dict
    }
    
    func openCheckoutPro() {
        PayU3DS2SDKHelper.open(on: rootViewController!, delegate: delegate, parameters: getUserDetailsDict() , config: config)
    }
    
    
    var currentKeyWindow: UIWindow? {
      UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .map { $0 as? UIWindowScene }
        .compactMap { $0 }
        .first?.windows
        .filter { $0.isKeyWindow }
        .first
    }

    var rootViewController: UIViewController? {
      currentKeyWindow?.rootViewController
    }
}
class Response: Identifiable{
    var data: String
    
    init(data: String){
        self.data = data
    }
    
}
class PayUCheckoutProDelegateClass: PayU3DS2Delegate, ObservableObject {
    func generateHash(for param: [String : String], onCompletion: @escaping PayU3DS2Kit.PayU3DS2HashGenerationCompletion) {
        let commandName = param[PayU3DS2HashConstants.hashName] ?? ""
        let hashStringWithoutSalt = param[PayU3DS2HashConstants.hashString] ?? ""
        let postSalt = param[PayU3DS2HashConstants.postSalt] ?? ""
        // get hash for "commandName" from server
        // get hash for "hashStringWithoutSalt" from server
        // After fetching hash set its value in below variable "hashValue"
        let hashValue = Utils.sha512Hex(string: hashStringWithoutSalt + salt + postSalt)
        onCompletion([commandName: hashValue])
    }
    
    func onError(errorCode: Int, errorMessage: String) {
        print("error\n",errorMessage)
    }
    
    
   @Published var showAlert = false
    @Published var response: Response?
    
    let salt: String
    init(salt: String) {
        self.salt = salt
    }


    func onError(_ error: Error?) {
        // handle error scenario
        print("error\n",error ?? "")
        response = Response(data: error?.localizedDescription ?? "")
        showAlert = true
    }

    
    func onPaymentSuccess(successResponse response: Any?) {
        // handle success scenario
        print("response\n",response ?? "")
        self.response = Response(data: response as? String ?? "Success")
        showAlert = true
       
    }
    
    func onPaymentFailure(failureResponse response: Any?) {
        // handle failure scenario
        print("response\n",response ?? "")
        self.response = Response(data: response as? String ?? "failure")
        showAlert = true
    }
    
    func onPaymentCancel(isTxnInitiated: Bool) {
        // handle txn cancelled scenario
        // isTxnInitiated == YES, means user cancelled the txn when on reaching bankPage
        // isTxnInitiated == NO, means user cancelled the txn before reaching the bankPage
        let completeResponse = "isTxnInitiated = \(isTxnInitiated)"
        //            showAlert(title: "Cancelled", message: "\(completeResponse)")
        print(completeResponse)
        response = Response(data: "cancel")
        showAlert = true
    }
        
}
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//
//  ContentView.swift
//  PayUCheckoutProWithSwiftUI
//
//  Created by Rishabh Jaiswal on 20/02/23.
//

import SwiftUI
import PayU3DS2Kit
import UIKit

let KscreenWidth = UIScreen.main.bounds.width
let Kscreenheight = UIScreen.main.bounds.height
var alertValue = ""
let keySalt = [["3TnMpV", "g0nGFe03"],
               ["gtKFFx", "4R38IvwiV57FwVpsgOvTXBdLE4tHUXFW"]]
let indexKeySalt = 0

@available(iOS 17.0, *)
struct ContentView: View {
    
       @State var labelWidth: CGFloat? = nil
       @State var key = keySalt[indexKeySalt][0]
       @State var salt = keySalt[indexKeySalt][1]
       @State var amount = "1"
       @State var merchantResponseTimeout = "5"
       @State var surl = "https://payu.herokuapp.com/ios_success"
       @State var furl = "https://payu.herokuapp.com/ios_success"
       @State var firstName = "Umang"
       @State var email = "umang@arya.com"
       @State private var phone: String = "8700908382"
       @State var userCredntials = "umang:arya123"
       @State var transactionID = "iOS" + (String(Int64(Date().timeIntervalSince1970)))
       @State var defaultLoaderColor = ""
       @State var backgroundColor = ""
       @State var headerFontColor = ""
       @State var fontSize1 = ""
       @State var fontColor1 = ""
       @State var cornerRadius = ""
       @State var fontColor = ""
       @State var fontSize = ""
       @State var resendFontColor = ""
       @State var textCaseType = ""
       @State var headerFontSize = ""
       @State var borderColor = ""
       @State var borderWidth = ""
       @State var cornerRadius1 = ""
       @State var fontColor2 = ""
       @State var fontSize2 = ""
       @State var backgroundColor1 = ""
       @State var cancelButtonText = ""
       @State var headerText = ""
       @State var fontColor3 = ""
       @State var fontSize3 = ""
       @State var subTextFontName = ""
       @State var headerFontName = ""
    
       @State var recurringAmount = "1"
       @State var billingInterval = "1"
       @State var billingCycle = ""
     
       @State var paymentStartDate = Date()
       @State var paymentEndDate = Date()

       @State var authenticateOnly = false
       @State var fallback3ds1 = true
       @State var productionEnvironment = true
       @State var autoSubmit = false
       @State var showDefaultLoader = false
       @State var customiseUI = false
       @State var enableSplitPay = false
    
       @State var environment = "production"
       @State private var isNetBanking = false
       @State private var isCards = false
       @State private var isEMI = false
       @State private var isUPI = false
       @State private var isWallet = false
       @State private var autoOtpSelect = false
       @State private var autoOtpSubmit = false
       @State private var si = false
       @State var ccdc = ""
       @State var config = PayU3DS2Config()
       @State private var showingAlert = false
   


   
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                Text("PayU 3DS2 Demo").bold()
                    .font(.system(size: 30, weight: .light, design: .rounded))
                    .frame(width: KscreenWidth - 20)
                    .multilineTextAlignment(.center)
                VStack(){
                    
                    VStack(){
                        
                        HStack{
                            Text("Key")
                            Spacer()
                            TextField("Key", text: $key)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        HStack{
                            Text("Salt")
                            Spacer()
                            TextField("Salt", text: $salt)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        HStack{
                            Text("Txn ID")
                            Spacer()
                            TextField("Transaction ID", text: $transactionID)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        HStack{
                            Text("Amount")
                            Spacer()
                            TextField("Amount", text: $amount)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        
                        HStack{
                            Text("E-mail")
                            Spacer()
                            TextField("Email", text: $email)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                            
                        }
                        .padding(.horizontal, 20)
                        
                        
                        
                        HStack{
                            Text("User Credentials")
                            Spacer()
                            TextField("User Credentials", text: $userCredntials)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                            
                        }
                        .padding(.horizontal, 20)
                        
                        
                        
                        HStack{
                            Text("Merchant Response Timeout")
                            Spacer()
                            TextField("Merchant Response Timeout", text: $merchantResponseTimeout)
                                .frame(width: KscreenWidth/3.5, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 0))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                                .onChange(of: merchantResponseTimeout) {
                                    config.merchantResponseTimeout = TimeInterval(Int(merchantResponseTimeout) ?? 0)
                                    
                                }
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.trailing, -35)
                        
                        
                        Toggle("Authenticate Only", isOn: $authenticateOnly)
                            .onChange(of: authenticateOnly) { value in
                                // action...
                                config.authenticateOnly = authenticateOnly
                                print(value)
                            }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        Toggle("Fallback 3ds1", isOn: $fallback3ds1)
                            .onChange(of: fallback3ds1) { value in
                                // action...
                                config.fallback3DS1 = fallback3ds1
                                print(value)
                            }
                            .onReceive([self.fallback3ds1].publisher.first()) { (value) in
                                config.fallback3DS1 = fallback3ds1
                                   print("New value is: \(value)")
                              }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        Toggle("Production Environment", isOn: $productionEnvironment)
                            .onChange(of: productionEnvironment) { value in
                                config.isProduction = productionEnvironment
                                // action...
                                print(value)
                            }
                            .onReceive([self.productionEnvironment].publisher.first()) { (value) in
                                config.fallback3DS1 = fallback3ds1
                                   print("New value is: \(value)")
                              }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        Toggle("Auto Submit", isOn: $autoSubmit)
                            .onChange(of: autoSubmit) { value in
                                // action...
                                config.autoSubmit = autoSubmit
                                print(value)
                            }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        Toggle("Show Default Loader", isOn: $showDefaultLoader)
                            .onChange(of: showDefaultLoader) { value in
                                // action...
                                print(value)
                            }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        
                    }
                    .padding(.trailing, 25)
                    
                    
                    VStack(){
                        
                        HStack{
                            Text("Default Loader Color")
                            Spacer()
                            TextField("#25272C", text: $defaultLoaderColor)
                                .frame(width: KscreenWidth/2, height: 45)
                                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(10)
                                .frame(maxWidth: 200)
                            
                            
                        }
                        .padding(.horizontal, 20)
                        
                        Toggle("Customise UI", isOn: $customiseUI)
                            .onChange(of: customiseUI) { value in
                                // action...
                                config.uiCustomisation = getUICustomisation()
                                print(value)
                            }
                            .onReceive([self.productionEnvironment].publisher.first()) { (value) in
                                config.uiCustomisation = getUICustomisation()
                                   print("New value is: \(value)")
                              }
                            .padding()
                            .frame(width: KscreenWidth, height: 50)
                        
                        
                        
                    }
                    .padding(.trailing, 25)
                    
                    if customiseUI == true{
                        
                        VStack(){
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.8))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Button Customisation")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.2))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Next Button")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            
                            
                            
                            VStack{
                                HStack{
                                    Text("Background Color")
                                    Spacer()
                                    TextField("#25272C", text: $backgroundColor)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 15)
                                
                                HStack{
                                    Text("Corner Radius")
                                    Spacer()
                                    TextField("10", text: $cornerRadius)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Color")
                                    Spacer()
                                    TextField("#ffffff", text: $fontColor)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Size")
                                    Spacer()
                                    TextField("17", text: $fontSize)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                HStack{
                                    Text("Resend Font Color")
                                    Spacer()
                                    TextField("#25272C", text: $resendFontColor)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Text Case Type")
                                    Spacer()
                                    TextField("uppercase/lowercase/default", text: $textCaseType)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            .padding(.trailing, 25)
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.8))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Label Cumtomisation")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            
                            VStack{
                                HStack{
                                    Text("Header Font Color")
                                    Spacer()
                                    TextField("#25272C", text: $headerFontColor)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 15)
                                
                                HStack{
                                    Text("Header Font Size")
                                    Spacer()
                                    TextField("17", text: $headerFontSize)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Size")
                                    Spacer()
                                    TextField("17", text: $fontSize1)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Color")
                                    Spacer()
                                    TextField("#25272C", text: $fontColor1)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            .padding(.trailing, 25)
                            
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.8))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Textbox Customisation")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            VStack{
                                HStack{
                                    Text("Border Color")
                                    Spacer()
                                    TextField("#25272C", text: $borderColor)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 15)
                                
                                HStack{
                                    Text("Border Width")
                                    Spacer()
                                    TextField("1", text: $borderWidth)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Corner Radius")
                                    Spacer()
                                    TextField("10", text: $cornerRadius1)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Color")
                                    Spacer()
                                    TextField("#25272C", text: $fontColor2)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                HStack{
                                    Text("Font Size")
                                    Spacer()
                                    TextField("17", text: $fontSize2)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            .padding(.trailing, 25)
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.8))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Toolbar Customisation")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            VStack{
                                HStack{
                                    Text("Background Color")
                                    Spacer()
                                    TextField("#D3D3D3", text: $backgroundColor1)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 15)
                                
                                HStack{
                                    Text("Cancel Button Text")
                                    Spacer()
                                    TextField("Cancel", text: $cancelButtonText)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Header Text")
                                    Spacer()
                                    TextField("Bank Page", text: $headerText)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                                HStack{
                                    Text("Font Color")
                                    Spacer()
                                    TextField("#25272C", text: $fontColor3)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                HStack{
                                    Text("Font Size")
                                    Spacer()
                                    TextField("17", text: $fontSize3)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            .padding(.trailing, 25)
                            
                            
                            ZStack {
                                // Background View
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.8))
                                    .frame(width: KscreenWidth - 20, height: 30)
                                
                                // Text with leading and trailing constraints
                                HStack {
                                    Spacer()
                                    Text("Font Family Customisation")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding(8) // Add padding around the custom view
                            
                            VStack{
                                HStack{
                                    Text("Header Font Name")
                                    Spacer()
                                    TextField("DancingScript-Medium", text: $headerFontName)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 15)
                                
                                HStack{
                                    Text("SubText Font Name")
                                    Spacer()
                                    TextField("DancingScipt-Medium", text: $subTextFontName)
                                        .frame(width: KscreenWidth/2, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 200)
                                    
                                    
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            .padding(.trailing, 25)
                            
                        }
                        
                    }
             
                    
                    VStack(){

                        NavigationLink(destination: CardView(key: $key, salt: $salt, txnId: $transactionID, amount: $amount, email: $email, userCredentials: $userCredntials, phone1: $phone, config: $config).navigationBarBackButtonHidden(true) , label: {
                            Text("Next")
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: KscreenWidth, height: 50)
                                .background(Rectangle().fill(Color.blue).shadow(radius: 3))
                        })
                    }
                    
                }
                
            }
            
        }
        
    
    }
    
    func getUICustomisation() -> PayU3DS2UICustomisation {
        PayU3DS2UICustomisation(
            buttonCustomisation: getButtonCustomisation(),
            labelCustomisation: getLabelCustomisation(),
            textBoxCustomisation: getTextboxCustomisation(),
            toolbarCustomisation: getToolbarCustomisation(),
            fontFamilyCustomisation: getFontFamilyCustomisation()
        )
    }

    func getButtonCustomisation() -> PayU3DS2ButtonCustomisation {
        PayU3DS2ButtonCustomisation(
            textFontColor: fontColor,
            textFontSize: Int(fontSize) ?? 0,
            backgroundColor: backgroundColor,
            cornerRadius: Int(cornerRadius) ?? 0,
            resendButtonTextFontColor: resendFontColor,
            textCaseType: getTextCaseType()
        )
    }


    func getLabelCustomisation() -> PayU3DS2LabelCustomisation {
        PayU3DS2LabelCustomisation(
            textFontColor: fontColor1,
            textFontSize: Int(fontSize1) ?? 0,
            headingTextColor: headerFontColor,
            headingTextFontSize: Int(headerFontSize) ?? 0
        )
    }
    private func getTextCaseType() -> PayU3DS2ButtonTextCaseType {
        switch textCaseType {
        case "lowercase": return .lowercase
        case "uppercase": return .uppercase
        default: return .default
        }
    }

    func getTextboxCustomisation() -> PayU3DS2TextBoxCustomisation {
        PayU3DS2TextBoxCustomisation(
            textFontColor: fontColor2,
            textFontSize: Int(fontSize2) ?? 0,
            borderColor: borderColor,
            borderWidth: Int(borderWidth) ?? 0,
            cornerRadius: Int(cornerRadius1) ?? 0
        )
    }

    func getToolbarCustomisation() -> PayU3DS2ToolBarCustomisation {
        PayU3DS2ToolBarCustomisation(
            textFontColor: fontColor3,
            textFontSize: Int(fontSize3) ?? 0,
            backgroundColor: backgroundColor1,
            buttonText: cancelButtonText,
            headerText: headerText
        )
    }

    func getFontFamilyCustomisation() -> PayU3DS2FontFamilyCustomisation {
        PayU3DS2FontFamilyCustomisation(
            headerFontFamily: headerFontName,
            subTextFontFamily: subTextFontName
        )
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


    

   
extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}

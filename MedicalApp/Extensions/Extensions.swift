//
//  File.swift
//  MedicalApp
//
//  Created by Mobin on 11/13/23.
//


//
//  EmailChecker .swift
//  MedicalApp
//
//  Created by mobin on 11/4/23.
//

import Foundation


extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

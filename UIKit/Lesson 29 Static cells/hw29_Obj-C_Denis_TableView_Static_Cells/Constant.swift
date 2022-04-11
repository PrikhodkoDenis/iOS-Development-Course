//
//  Constants.swift
//  hw29_Obj-C_Denis_TableView_Static_Cells
//
//  Created by Denis on 09.04.2022.
//

enum Key: String {
    case firstName = "keyFirstNameField"
    case lastName = "keyLastNameField"
    case login = "keyLoginField"
    case password = "keyPasswordField"
    case age = "keyAgeField"
    case phone = "keyPhoneField"
    case email = "keyEmailField"
}

enum Constant: String {
    case numbers = "0123456789"
    case englishLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    case russianLetters = "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
    case symbols = "§±!@#$%^&*()-_=+/*.,?><[]{};:'№|\u{0022}\u{007e}\u{00a3}\u{00a5}\u{20ac}\u{2022}\u{005c}"
    case symbolsEmail = "§±!#$%^&*()-_=+/*,?><[]{};:'№|\u{0022}\u{007e}\u{00a3}\u{00a5}\u{20ac}\u{2022}\u{005c}"
}

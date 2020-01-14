//
//  Customer.swift
//  App
//
//  Created by Vivek Aggarwal on 13/01/20.
//
import FluentSQLite
import Foundation
import Vapor

struct Customer:Content,SQLiteModel,Migration{
    var id: Int?
    var name:String
    var age: Int
    var password:String
}


//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Double
    public var currency : String
    
    public func convert(_ to: String) -> Money {
        var newAmount : Double = 0
        switch currency {
        case "USD":
            switch to {
            case "GBP":
                newAmount = amount * 0.5
            case "EUR":
                newAmount = amount * 1.5
            case "CAN":
                newAmount = amount * 1.25
            case "USD":
                newAmount = amount * 1
            default:
                print("Only converting to USD, GBP, EUR, and CAN is available.", terminator:"")
            }
        case "GBP":
            switch to {
            case "GBP":
                newAmount = amount * 1
            case "EUR":
                newAmount = amount * 1.5
            case "CAN":
                newAmount = amount * 2.5
            case "USD":
                newAmount = amount * 2
            default:
                print("Only converting to USD, GBP, EUR, and CAN is available.", terminator:"")
            }
        case "EUR":
            switch to {
            case "GBP":
                newAmount = amount / 3
            case "EUR":
                newAmount = amount * 1
            case "CAN":
                newAmount = amount / 6 * 5
            case "USD":
                newAmount = amount / 1.5
            default:
                print("Only converting to USD, GBP, EUR, and CAN is available.", terminator:"")
            }
        case "CAN":
            switch to {
            case "GBP":
                newAmount = amount * 0.8
            case "EUR":
                newAmount = amount / 5 * 6
            case "CAN":
                newAmount = amount * 1
            case "USD":
                newAmount = amount / 1.25
            default:
                print("Only converting to USD, GBP, EUR, and CAN is available.", terminator:"")
            }
            
        default:
            print("Only converting to USD, GBP, EUR, and CAN is available.", terminator:"")
        }
        let newMoney = Money(amount: newAmount, currency: to) //update the amount and currency name
        return newMoney
    }
    
    public func add(_ to: Money) -> Money {
        let newSelfMoney = self.convert(to.currency)//convert self to the new currency
        let newAmount = newSelfMoney.amount + to.amount //use the new currency to present total amount
        let newCurrency = to.currency
        let newMoney =  Money(amount: newAmount, currency: newCurrency)
        return newMoney
    }
    
    public func subtract(_ from: Money) -> Money {
        let newSelfMoney = self.convert(from.currency)//convert self to the new currency
        let newAmount = newSelfMoney.amount - from.amount //use the new currency to present total amount
        let newCurrency = from.currency
        let newMoney =  Money(amount: newAmount, currency: newCurrency)
        return newMoney
    }
}
////////////////////////////////////
// Job
//
open class Job {
    fileprivate var title : String
    fileprivate var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    open func calculateIncome(_ hours: Int) -> Double {
        switch type {
        case .Hourly(let hourly): //access associate values in enum
            return Double(hours)*hourly //convert hours to Double data type to enable calculation
        case .Salary(let salary):
            return Double(salary) //no need to use 'default' because it has iterated all cases
        }
    }
    
    open func raise(_ amt : Double) {
        switch type {
        case .Hourly(var hourly):
            hourly = hourly + amt
        case .Salary(var salary):
            salary = salary + Int(amt)
        }
    }
}
////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get{
        if age >= 16{
            var jobable : Job? = Job(title: "", type: Job.JobType.Hourly(0))
        }
        return jobable
    }
    set(value){
        

    }
    }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
        if age < 18{
            var spouseable : Person? = nil
        }
        return spouseable
    }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}






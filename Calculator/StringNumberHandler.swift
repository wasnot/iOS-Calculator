//
//  StringNumberHandler.swift
//  Calculator
//
//  Created by AidaAkihiro on 2015/07/08.
//  Copyright (c) 2015年 Wasnot Apps. All rights reserved.
//

import Foundation

class StringNumberHandler {
    
    // 整数の判定
    class func isHandlingInt(origString:String)->Bool{
        for ch in origString{
            if(toString(ch) == "."){
                return false
            }
        }
        return true
    }
    
    // intへの変換
    class func toInt(origString:String)->Int{
        if let resultInt = origString.toInt(){
            return resultInt
        }
        return 0
    }
    
    // doubleへの変換
    class func toDouble(origString:String)->Double{
        return  (origString as NSString).doubleValue
    }
    
    class func calc(stringA: String, stringB: String) -> String {
        //どちらの値も整数なら
        if(StringNumberHandler.isHandlingInt(stringA) && StringNumberHandler.isHandlingInt(stringB)){
            //StringNumberHandlerのメソッドtoIntを用いている
            var intResult = StringNumberHandler.toInt(stringA) * StringNumberHandler.toInt(stringB)
            return toString(intResult)
        }
            
        else{
            var doubleA = StringNumberHandler.toDouble(stringA)
            var doubleB = StringNumberHandler.toDouble(stringB)
            
            var doubleResult = doubleA * doubleB
            
            return toString(doubleResult)
        }
    }
    
    
    // 小数点以下の桁数を求める
    class func getNumberOfFractionalDigit(theValue:Double)->Int{
        var array = toString(theValue).componentsSeparatedByString(".")
        if(array.count == 2){
            return count(array[1])
        }
        return 0
    }
    
    // 指定した小数点以下桁数で四捨五入したdoubleをstringでかえす
    class func getStringForTrimmedDoubleNumber(theValue:Double, inNumber numberOfDigit:Int)->String{
            return String(format:"%.\(numberOfDigit)f", theValue)
    }
    
    // どちらが大きいか
    class func selectLargerInt(a:Int, comparedTo b:Int)->Int{
        return (a > b ?a : b)
    }
    
    class func test() -> String{
        var a :Double = 23.46532 ;
        var i :Int
        var j :Int ;
        i = Int(a) ;
        a = a - Double(i) ;
        j = Int((a + 0.05) * 10.0) ;
        if (j >= 10) {
            i = i + 1
            j -= 10 ;
        }
        return String(format: "%d.%d", i, j) ;
    }
    class func test2()->String{
        let a = 23.43532
        let b = round(a * 10.0) / 10.0
        return "\(b)"
    }
    class func test3()->String{
        let d: Double=2.3456;
        let l : Int;
        let dd:Double;
        let k:Double;
        dd = (d * 10); /*１０倍する*/
        l = Int(dd); /* long型に入れる */
        k = Double(l) / 10; /* 10で割ってdouble型に代入 */
        return String(format: "%f : %f ",d,k);
    }
}

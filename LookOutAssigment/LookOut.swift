//
//  LookOut.swift
//  LookOutAssigment
//
//  Created by James Folk on 6/2/22.
//

import Foundation
import JavaScriptCore

class LookOut {
    
    private static func eval(integerValue integer:Int, javascriptSnippit script:String) -> Int? {
        if let context = JSContext() {
            context.setObject(integer,
                               forKeyedSubscript: "x" as NSString)
            let script1 = "function func(x) {"
            let script3 = "}func(x);"
            let scriptFinal = script1 + script + script3
            if let result = context.evaluateScript(scriptFinal) {
                return Int(result.toInt32())
            }
        }
        return nil
    }

    public static func partition_helper(list l: Array<Int>, javascriptSnippit script:String) async -> [Int:[Int]] {
        var cache = [Int:[Int]]()
        for x in l {
            if let ans = eval(integerValue: x, javascriptSnippit: script) {
                if nil != cache[ans] {
                    cache[ans]!.append(x)
                } else {
                    cache[ans] = [x]
                }
            }
        }
        return cache
    }
    public static func partition(list1 l1: Array<Int>, list2 l2:Array<Int>, javascriptSnippit script:String) async -> [[Int]] {
        var answer = [[Int]]()
        let cache1 = await LookOut.partition_helper(list: l1, javascriptSnippit: script)
        let cache2 = await LookOut.partition_helper(list: l2, javascriptSnippit: script)
        
        for item in cache1 {
            if var otherItem = cache2[item.key] {
                otherItem.append(contentsOf: item.value)
                answer.append(otherItem)
                
            }
        }
        return answer
        
    }
    
}


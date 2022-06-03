//
//  LookOutAssigmentTests.swift
//  LookOutAssigmentTests
//
//  Created by James Folk on 6/2/22.
//

import XCTest
@testable import LookOutAssigment

extension Array {
    func sum() -> Int {
        var sum = 0
        for i in self {
            if let n = Int(i as? String ?? "") {
                sum = sum + n
            }
        }
        return sum
    }
}

class LookOutAssigmentTests: XCTestCase {

    public static func arraysEqual(list1 l1: Array<Array<Int>>, list2 l2: Array<Array<Int>>) {
        var ary1 = [Int]()
        for itemI in l1 {
            for itemJ in itemI {
                ary1.append(itemJ)
            }
        }
        ary1.sort()
        
        var ary2 = [Int]()
        for itemI in l2 {
            for itemJ in itemI {
                ary2.append(itemJ)
            }
        }
        ary2.sort()
        
        XCTAssertEqual(ary1, ary2)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPartitionHelper_Fib() async throws {
        var l:Array<Int> = [Int]()
        let benchmark = [-2: [-2], -6: [-6], 0: [0], -5: [-5], -1: [-1], -9: [-9], 3: [4], -8: [-8], 34: [9], -7: [-7], 1: [1, 2], 13: [7], 8: [6], -4: [-4], 55: [10], -3: [-3], -10: [-10], 5: [5], 21: [8], 2: [3]]
        let script = """
            // program to display fibonacci sequence using recursion
            function fibonacci(num) {
                if(num < 2) {
                    return num;
                }
                else {
                    return fibonacci(num-1) + fibonacci(num - 2);
                }
            }
            return fibonacci(x);
        """
        
        for i in -10...10 {
            l.append(i)
        }
        let ans = await LookOut.partition_helper(list: l, javascriptSnippit: script)
        XCTAssertEqual(ans, benchmark)
    }
    
    func testPartition_Mod2() async throws {
        let l1 = [1, 2, 3, 4, 5]
        let l2 = [6, 7, 8, 9, 10]
        let script = "return x % 2;"
        let benchmark = [[1, 3, 5, 7, 9], [2, 4, 6, 8, 10]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
    
    func testPartition_Squared() async throws {
        let l1 = [-1, 2, 3]
        let l2 = [1, 2, -3, 4]
        let script = "return x * x;"
        let benchmark = [[-1, 1], [2, 2], [3, -3]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
    
    func testPartition_CubedAbsolute() async throws {
        let l1 = [-1, 2, 3]
        let l2 = [1, 2, -3, 4]
        let script = """
            return Math.abs(x) * Math.abs(x) * Math.abs(x);
        """
        let benchmark = [[-1, 1], [2, 2], [3, -3]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
    
    func testPartition_Cubed() async throws {
        let l1 = [-1, 2, 3]
        let l2 = [1, 2, -3, 4]
        let script = """
            return x * x * x;
        """
        let benchmark = [[2, 2]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
    
    func testPartition_Sign() async throws {
        let l1 = [-1, 2, 3]
        let l2 = [1, 2, -3, 4]
        let script = """
            return Math.sign(x);
        """
        let benchmark = [[-1, -3], [2, 3, 1, 2, 4]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
    
    func testPartition_Fib() async throws {
        let l1 = [-1, 2, 3]
        let l2 = [1, 2, -3, 4]
        let script = """
            // program to display fibonacci sequence using recursion
            function fibonacci(num) {
                if(num < 2) {
                    return num;
                }
                else {
                    return fibonacci(num-1) + fibonacci(num - 2);
                }
            }
            return fibonacci(x);
        """
        let benchmark = [[1, 2, 2]]
        
        let ans = await LookOut.partition(list1: l1, list2: l2, javascriptSnippit: script)
        LookOutAssigmentTests.arraysEqual(list1: benchmark, list2: ans)
    }
}

//: Playground - noun: a place where people can play

import UIKit

//*****************************  defer用法  *****************************
func lookforSomething(name:String) throws ->(NSString){
    //这里是作用域1 整个函数作用域
    
    print("1-1")
    if name == ""{
        //这里是作用域2 if的作用域
        print("2-1")
        defer{
            print("2-2")
        }
        print("2-3")
    }
    print("1-2")
    defer{
        print("1-3")
    }
    defer{
        print("1-4")
    }
    print("1-5")
    
    if name == "hello"{
        //作用域3
        print("3-1")
        defer{
            print("3-2")
        }
        print("3-3")
        defer{
            print("3-4")
        }
    }
    return "lastString"
}

//print(try! lookforSomething(name: "hello"))

//*****************************  throw用法  *****************************

enum OperationError : Error {
    case ErrorOne
    case ErrorTwo
    case ErrorThree(String)
    case ErrorOther
}

func throwDeliver(num:Int) throws ->String {
    print("---------", "错误传递开始","---------")
    try numberTest(num: num)
    print("未传递错误")
    print("---------","传递错误结束","---------")

    return "无错误"
}

func numberTest(num:Int) throws{
    if num == 1 {
        print("成功")
    }else if num == 2 {
        throw OperationError.ErrorTwo
    }else if num == 3{
        throw OperationError.ErrorThree("失败")
    }else {
        throw OperationError.ErrorOther
    }
}

//错误处理方式1  最后要有一个处理默认的 catch
do {
    try throwDeliver(num: 0)
} catch  OperationError.ErrorOne{
    print("ErrorOne")
    
}catch let discription{
    print(discription)
}
//错误处理方式2  当有错误时try会返回nil
try? throwDeliver(num: 2)
//错误处理方式3  当有错误时会crash
try! throwDeliver(num: 1)

//*****************************  guard用法  *****************************

//参数前面加下划线,该函数在外部调用时就不用显示参数名
func testGuard(_ string: NSString?,_ num: NSInteger?) {
    guard let name = string, let age = num else {
        print("guard没通过")
        return
    }
    print(name, " ", age)
}
testGuard("小明", nil)

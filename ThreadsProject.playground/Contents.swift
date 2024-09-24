import UIKit

//let main = DispatchQueue.main
//let global = DispatchQueue.global()
//
let item = DispatchWorkItem {
    print(1)
}
DispatchQueue.main.async(execute: item)
//item.cancel()
//
//item.notify(queue: .main) {
//    guard !item.isCancelled else {
//        print("Cancelled")
//        return
//    }
//    print(3)
//}
//
//main.asyncAfter(deadline: .now() + 2, execute: item)
//
//main.asyncAfter(deadline: .now()) {
//    print(2)
//}
//
//let myQueue = DispatchQueue(label: "com.custom.queue")
//
//myQueue.async {
//    Thread.sleep(forTimeInterval: 3)
//    print(Thread.isMainThread)
//}
//
//
//let dispatchGroup = DispatchGroup()
//
//dispatchGroup.enter()
//DispatchQueue.main.async {
//    print(8)
//    dispatchGroup.leave()
//}
//
//dispatchGroup.enter()
//DispatchQueue.global().async {
//    print(9)
//    dispatchGroup.leave()
//}
//
//dispatchGroup.notify(queue: .main) {
//    print(10)
//}

class MyOperation: Operation {
    override func main() {
        print("my operation")
    }
}

let operation = BlockOperation {
    print(11)
}

let operation2 = BlockOperation {
    print(12)
}

//operation.addDependency(operation2)
//operation.cancel()
let queue = OperationQueue()

//queue.addOperation(operation)
//queue.addOperation(operation2)

let myOperation = MyOperation()
myOperation.completionBlock = {
    print("my operation done")
}
//queue.addOperation(myOperation)
queue.addOperations([operation, operation2, myOperation], waitUntilFinished: true)

// Потокобезопасность

//DispatchSemaphore - можно сделать так, чтобы только один поток мог выполнять какие-то блоки кода (то есть в параметрах семафора указать 1)
let semaphore = DispatchSemaphore(value: 1)

var count = 0 {
    didSet {
        print("Count: \(count)")
    }
}

//DispatchQueue.global().async {
//    semaphore.wait()
//    count += 1
//    semaphore.signal()
//}
//
//DispatchQueue.global().async {
//    semaphore.wait()
//    count -= 1
//    semaphore.signal()
//}

//Барьеры - если указать барьер в параметрах, то этот блок кода подождет пока остальные потоки закончат свою работу, и только тогда наш блок кода начнет свою работу, но при это другие потоки не будут работать пока не закончится наш
let myCustomQueue = DispatchQueue(label: "com.my.queue", attributes: .concurrent)

//myCustomQueue.async {
//    count += 1
//}
//
//myCustomQueue.async {
//    count += 1
//}
//
//myCustomQueue.async(flags: .barrier) {
//    count -= 1
//}

//Lock - код не сможет начать выполняться, пока локер находится в состоянии lock. Это обеспечивает, что критические секции внутри лока не будут выполняться одновременно
//let locker = NSLock()
//
//DispatchQueue.global().async {
//    locker.lock()
//    count += 1
//    locker.unlock()
//}
//
//DispatchQueue.global().async {
//    locker.lock()
//    count -= 1
//    locker.unlock()
//}


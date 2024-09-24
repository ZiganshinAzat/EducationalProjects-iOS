import UIKit


let queue = DispatchQueue(label: "azat", attributes: .concurrent)

//DispatchQueue.global().async {
//    print("Current thread: \(Thread.current)")
//    DispatchQueue.global().sync {
//        print("Current thread: \(Thread.current)")
//    }
//}

queue.async {
    print("1 - Current thread: \(Thread.current)")

    queue.async {
        print("2 - Current thread: \(Thread.current)")
        print("2 - Current thread: \(Thread.current)")
        print("2 - Current thread: \(Thread.current)")
    }

    print("3 - Current thread: \(Thread.current)")
    print("3 - Current thread: \(Thread.current)")
    print("3 - Current thread: \(Thread.current)")
}

// Ожидание, чтобы убедиться, что асинхронная задача выполнена
sleep(1)

//BlockOperation: to create operation out of block of code by passing closure to Block operation initializer
//BlockOperation job is to manage the execution of one or more closures (group of clouses) on default globle queue
//One of BlockOperation use cases is when the whole app uses operation and you wanna exeucte block of code concurrently without creating seperate DispatchQueue
//tasks in BlockOperation run concurrently so if you wanna run it serially you could use private DispatchQueue or setup dependencies
//BlockOperation with multiple closures works as DispatchGroup and mark itself as finished when all of its closures have finished
// It also has completionBlock property that excute when all of its closures finished excution

import Foundation

// create BlockOperation with single closure
var blockOperation = BlockOperation {
    print("Hello, playground")
}

// add multiple closures to BlockOperation using addExecutionBlock
for word in "Block Operation Example".split(separator: " ") {
    blockOperation.addExecutionBlock {
        print(word)
    }
}

//notify when all closures have finished
blockOperation.completionBlock = {
    print("All closures have finished")
}

// start
blockOperation.start()


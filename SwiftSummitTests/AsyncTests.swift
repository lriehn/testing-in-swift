import XCTest
import SwiftSummit

class AsyncTests: XCTestCase {
    class AsyncDispatcher {
        func dispatch(#global: (Void) -> Void, main: (Void) -> Void) {
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                global()
                dispatch_async(dispatch_get_main_queue()) {
                    main()
                }
            }
        }
    }
    
    func testShouldCallGlobalAndMainDispatch() {
        //given
        var dispatcher = AsyncDispatcher()
        var calledCallbacks: [String] = []
        var expectation = expectationWithDescription("")
        
        //when
        dispatcher.dispatch(
            global: { () -> Void in
                calledCallbacks.append("global")
            }, main: { () -> Void in
                calledCallbacks.append("main")
                expectation.fulfill()
            }
        )
        waitForExpectationsWithTimeout(5, handler: nil)
        
        //then
        XCTAssertEqual(calledCallbacks, ["global", "main"])
    }
    
    
    
    func testShouldReceiveDataFromSwiftSummit() {
        let url = NSURL(string: "http:/swiftsummit.com")!
        var dataReceived: NSData? = nil
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            XCTAssertTrue(false)
        }
        task.resume()
    }
}
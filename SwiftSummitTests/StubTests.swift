import XCTest
import SwiftSummit

class StubTests: XCTestCase {
    class MailServiceStub: MailService {
        private var messages: [Message] = []
        
        func send(msg: Message) {
            messages.append(msg)
        }
        
        func numberSent() -> Int {
            return messages.count
        }
    }
    
    func testShouldSendMailAfterOrderSubmitted() {
        //given
        let mailServiceStub = MailServiceStub()
        let orderService = OrderService(mailService: mailServiceStub)
        
        //when
        orderService.submit(Account(email: "", password: ""))
        
        //then
        XCTAssertEqual(1, mailServiceStub.numberSent())
    }
}
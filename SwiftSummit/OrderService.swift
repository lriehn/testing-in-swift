import Foundation

public class OrderService {
    private var mailService: MailService
    
    public init(mailService: MailService) {
        self.mailService = mailService
    }
    
    public func submit(account: Account) {
        mailService.send(Message())
    }
}
import Foundation

public protocol MailService {
    func send(msg: Message)
}
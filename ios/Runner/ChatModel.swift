//
//  ChatModel.swift
//  Runner
//
//  Created by Oluwaseyifunmi Ipaye on 29/03/2025.
//

import Foundation
import GRDB

// Enum for CallStatus
enum CallStatus: String, Codable {
    case connecting
    case ringing
    case connected
    case missed
    case noAnswer
    case cancelled
    case completed

    // Factory method to create CallStatus from a string
    static func fromString(_ status: String) -> CallStatus {
        return CallStatus(rawValue: status) ?? .connecting
    }

    // Convert CallStatus to string
    func toString() -> String {
        return self.rawValue
    }
}

// Enum for CallType
enum CallType: String, Codable {
    case voice
    case video

    // Factory method to create CallType from a string
    static func fromString(_ type: String) -> CallType {
        return CallType(rawValue: type) ?? .voice
    }

    // Convert CallType to string
    func toString() -> String {
        return self.rawValue
    }
}

// Enum for CallDirection
enum CallDirection: String, Codable {
    case incoming
    case outgoing

    // Factory method to create CallDirection from a string
    static func fromString(_ direction: String) -> CallDirection {
        return CallDirection(rawValue: direction) ?? .incoming
    }

    // Convert CallDirection to string
    func toString() -> String {
        return self.rawValue
    }
}

// ZenCall class
struct ZenCall: Codable {
    var callId: String?
    var callDuration: Date?
    var callEndTime: Date?
    var callType: CallType
    var callStatus: CallStatus
    var callDirection: CallDirection

    // Convert ZenCall to a dictionary (toMap equivalent)
    func toDictionary() -> [String: Any] {
        return [
            "callId": callId ?? "",
            "callDuration": callDuration?.iso8601String ?? "",
            "callEndTime": callEndTime?.iso8601String ?? "",
            "callType": callType.toString(),
            "callStatus": callStatus.toString(),
            "callDirection": callDirection.toString(),
        ]
    }

    // Create a ZenCall instance from a dictionary (fromMap equivalent)
    static func fromDictionary(_ dict: [String: Any]) -> ZenCall? {
        guard let callTypeString = dict["callType"] as? String,
            let callStatusString = dict["callStatus"] as? String,
            let callDirectionString = dict["callDirection"] as? String
        else {
            return nil
        }

        let callId = dict["callId"] as? String
        let callDuration = (dict["callDuration"] as? String)?.toDate()
        let callEndTime = (dict["callEndTime"] as? String)?.toDate()
        let callType = CallType.fromString(callTypeString)
        let callStatus = CallStatus.fromString(callStatusString)
        let callDirection = CallDirection.fromString(callDirectionString)

        return ZenCall(
            callId: callId,
            callDuration: callDuration,
            callEndTime: callEndTime,
            callType: callType,
            callStatus: callStatus,
            callDirection: callDirection
        )
    }
}

// Extensions for Date to handle ISO8601 strings
extension Date {
    var iso8601String: String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}

extension String {
    func toDate() -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: self)
    }
}

// Define the ChatMessage struct that conforms to Codable and FetchableRecord
struct ChatMessage: Codable, FetchableRecord, PersistableRecord {
    var id: String
    var message_id: String
    var room_id: String
    var key_bundle: String?
    var new_message: String?
    var zen_call: String?
    var is_forwarded: Bool
    var local_file_path: String?  //
    var medias: String?  //
    var sender_id: String
    var sent_at: Date?
    var delivered_at: Date?
    var read_at: Date?
    var created_at: Date
    var is_deleted: Bool
    var read_by: String?  //
    var distribution_key: String?
    var sender_name: String
    var progress: Double
    var is_downloading: Bool
    var message_created: String
    var decrypted: Bool?
    var replied_message_id: String?
    var message_type: String
    var document_urls: String?  //
    var deleted_for_me: Bool?
    var reactions: [String]  //
    var status: MessageStatus

    func encode(to container: inout PersistenceContainer) {
        container["id"] = id
        container["message_id"] = message_id
        container["room_id"] = room_id
        if let zen_call = zen_call { container["zen_call"] = zen_call }
        container["is_forwarded"] = is_forwarded
        container["sender_id"] = sender_id
        container["created_at"] = created_at
        container["is_deleted"] = is_deleted
        if let read_by = read_by { container["read_by"] = read_by }
        container["sender_name"] = sender_name
        container["progress"] = progress
        container["is_downloading"] = is_downloading
        container["message_created"] = message_created
        container["message_type"] = message_type
        
        // Convert reactions array to JSON string
        let jsonData = try? JSONEncoder().encode(reactions)
        container["reactions"] = jsonData.flatMap { String(data: $0, encoding: .utf8) }
        
        container["status"] = status.rawValue



        // Only encode non-nil values
        if let key_bundle = key_bundle { container["key_bundle"] = key_bundle }
        if let new_message = new_message {
            container["new_message"] = new_message
        }
        if let local_file_path = local_file_path {
            container["local_file_path"] = local_file_path
        }
        if let medias = medias { container["medias"] = medias }
        if let sent_at = sent_at { container["sent_at"] = sent_at }
        if let delivered_at = delivered_at {
            container["delivered_at"] = delivered_at
        }
        if let read_at = read_at { container["read_at"] = read_at }
        if let distribution_key = distribution_key {
            container["distribution_key"] = distribution_key
        }
        if let decrypted = decrypted { container["decrypted"] = decrypted }
        if let replied_message_id = replied_message_id {
            container["replied_message_id"] = replied_message_id
        }
        if let document_urls = document_urls {
            container["document_urls"] = document_urls
        }
        if let deleted_for_me = deleted_for_me {
            container["deleted_for_me"] = deleted_for_me
        }
    }
}

// Define the MessageStatus enum
enum MessageStatus: String, Codable {
    case saved
    case sent
    case delivered
    case read
    case downloading
    case decryptionFailure
    case failed
}

// Define the database table
extension ChatMessage {
    static let databaseTableName = "chat_messages_entity"

        // Define the database columns
        enum Columns {
            static let id = Column("id")
            static let messageId = Column("messageId")
            static let roomId = Column("roomId")
            static let keyBundle = Column("keyBundle")
            static let newMessage = Column("newMessage")
            static let zenCall = Column("zenCall")
            static let isForwarded = Column("isForwarded")
            static let localFilePath = Column("localFilePath")
            static let medias = Column("medias")
            static let senderId = Column("senderId")
            static let sentAt = Column("sentAt")
            static let deliveredAt = Column("deliveredAt")
            static let readAt = Column("readAt")
            static let createdAt = Column("createdAt")
            static let isDeleted = Column("isDeleted")
            static let readBy = Column("readBy")
            static let distributionKey = Column("distributionKey")
            static let senderName = Column("senderName")
            static let progress = Column("progress")
            static let isDownloading = Column("isDownloading")
            static let messageCreated = Column("messageCreated")
            static let decrypted = Column("decrypted")
            static let repliedMessageId = Column("repliedMessageId")
            static let messageType = Column("messageType")
            static let documentUrls = Column("documentUrls")
            static let deletedForMe = Column("deletedForMe")
            static let reactions = Column("reactions")
            static let status = Column("status")
        }
}

// Migration to create the table
func createChatMessagesTable(_ db: Database) throws {
    try db.create(table: ChatMessage.databaseTableName) { t in
        t.column("id", .text).primaryKey()
        t.column("messageId", .text).unique()
        t.column("roomId", .text).notNull()
        t.column("keyBundle", .text)
        t.column("newMessage", .text)
        t.column("zenCall", .text)
        t.column("isForwarded", .boolean).notNull().defaults(to: false)
        t.column("localFilePath", .text)
        t.column("medias", .text)
        t.column("senderId", .text).notNull()
        t.column("sentAt", .datetime)
        t.column("deliveredAt", .datetime)
        t.column("readAt", .datetime)
        t.column("createdAt", .datetime).notNull()
        t.column("isDeleted", .boolean).notNull().defaults(to: false)
        t.column("readBy", .text)
        t.column("distributionKey", .text)
        t.column("senderName", .text).notNull()
        t.column("progress", .double).notNull().defaults(to: 0.0)
        t.column("isDownloading", .boolean).notNull().defaults(to: false)
        t.column("messageCreated", .text).notNull()
        t.column("decrypted", .boolean)
        t.column("repliedMessageId", .text)
        t.column("messageType", .text).notNull()
        t.column("documentUrls", .text)
        t.column("deletedForMe", .boolean)
        t.column("reactions", .text)
        t.column("status", .text).notNull()
    }
}

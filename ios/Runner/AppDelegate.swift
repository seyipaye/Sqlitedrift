import Flutter
import UIKit
import sqlite3

@main
@objc class AppDelegate: FlutterAppDelegate {
    var realmVM = RealmViewModel()
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(
            name: "com.example.myapp/methods",
            binaryMessenger: controller.binaryMessenger)

        GeneratedPluginRegistrant.register(with: self)
        methodChannel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "nativeMethod" {
                if let args = call.arguments as? [String: Any],
                    let name = args["name"] as? String,
                    let email = args["email"] as? String
                {
                    //                self.nativeMethod(result: result)
                    //                    addUser(name: name, email: email)
                    //                    self.realmVM.createCallLog2()
                    self.realmVM.updateCallLog()
                    //                    self.realmVM.query()

                    // updateChatMessage(
                    //     id: "2025-03-29T08:ddfs",
                    //     messageID: "2025-03-29T08:22:22.sdsdf",
                    //     roomID: "pr678970dd48faf24350f2c3d4 | 67b3342b0afa77c6e2cbb3a8",
                    //     zenCall: "{ \"callId\": \"pr678970dd48faf24350f2c3d4 | 67b3342b0afa77c6e2cbb3a8Oluwaseyifunmi Ipayedb4b3adc - d755 - 4bd5 - a1bd - 9f7be45c5771\", \"callDuration\": null, \"callEndTime\": null, \"callType\": \"voice\", \"callStatus\": \"cancelled\", \"callDirection\": \"incoming\" }",
                    //     isForwarded: false,
                    //     senderID: "678970dd48faf24350f2c3d4",
                    //     createdAt: 1743260332,
                    //     isDeleted: false,
                    //     readBy: nil,
                    //     senderName: nil,
                    //     progress: 0.0,
                    //     isDownloading: false,
                    //     messageCreated: "2025-03-29T14:58:52.112419Z",
                    //     messageType: "call",
                    //     reactions: "[]",
                    //     status: "read"
                    // )

                } else {
                    result(
                        FlutterError(
                            code: "INVALID_ARGUMENTS",
                            message: "Missing name or email", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(
            application, didFinishLaunchingWithOptions: launchOptions)
    }
}

class RealmViewModel {
    var db: SQLiteDatabase!
    var db1: OpaquePointer?

    private func getDatabasePath() -> String? {
        let fileManager = FileManager.default
        if let dir = fileManager.urls(
            for: .documentDirectory, in: .userDomainMask
        ).first {
            return dir.appendingPathComponent("app.db").path
        }
        return nil
    }

    func initDB1() {
        guard let dbPath = getDatabasePath() else {
            print("Error: Could not get database path.")
            return
        }

        if sqlite3_open(dbPath, &db1) != SQLITE_OK {
            print("Error opening SQLite database.")
        } else {
            print("SQLite database initialized successfully.")
            //               createTables() // Ensure tables exist
            let sql = "PRAGMA debug = 1;"
            if sqlite3_exec(db1, sql, nil, nil, nil) != SQLITE_OK {
                print(
                    "Failed to enable debugging: \(String(cString: sqlite3_errmsg(db1)))"
                )
            }
        }
    }

    func initDB() {
        do {
            db = try SQLiteDatabase.open(path: getDatabasePath() ?? "")
            print("Successfully opened connection to database.")
        } catch let error as SQLiteError {
            print("SQLite error: \(error)")
        } catch {
            print("Unexpected error: \(error.localizedDescription)")
        }
    }

    /// Disconnect from SQLite3 database
    func disconnectDB() {
        if db != nil {
            sqlite3_close(db1)
            db = nil
            print("SQLite database closed.")
        }
    }

    func createCallLog2() -> String? {

        let id = String(Int64(Date().timeIntervalSince1970 * 1000))  // milliseconds since epoch
        let createdAt = String(Int64(Date().timeIntervalSince1970))  // UNIX timestamp
        let messageCreated = ISO8601DateFormatter().string(from: Date())
        let status = "read"
        var reactions: String = "[]"  // JSON representation of an empty array

        //        let reactionsList: [String] = []  // Empty list
        //        if let jsonData = try? JSONSerialization.data(withJSONObject: reactionsList, options: []),
        //            let jsonString = String(data: jsonData, encoding: .utf8)
        //        {
        //            reactions = jsonString
        //            print("Jogular")
        //            print(jsonString)  // Output: "[]"
        //
        //        }

        let zenCall = LogZenCall(
            callId: "call.data.callId",
            callDuration: Date(),
            callEndTime: Date(),
            callType: .voice,
            callStatus: .ringing,
            callDirection: .incoming
        )

        print(zenCall.toJSONString())

        initDB()

        let contact = ChatMessage(
            id: "vbubu",
            message_id: "fcuybinuiu",
            room_id: "kiuiuiubub",
            zen_call: zenCall,
            is_forwarded: false,
            sender_id: "String",
            created_at: Date(),
            is_deleted: false,
            read_by: "",
            sender_name: "String",
            progress: 0.0,
            is_downloading: false,
            message_created: "wewe",
            message_type: "call",
            reactions: [],
            status: MessageStatus.read
        )

        do {
            try db.insertChatMessage(chatMessage: contact)
        } catch {
            print(db.errorMessage)
        }

        query()
        //        disconnectDB()

        return "call.callId"
    }

    func updateCallLog() -> String? {

        //        let reactionsList: [String] = []  // Empty list
        //        if let jsonData = try? JSONSerialization.data(withJSONObject: reactionsList, options: []),
        //            let jsonString = String(data: jsonData, encoding: .utf8)
        //        {
        //            reactions = jsonString
        //            print("Jogular")
        //            print(jsonString)  // Output: "[]"
        //
        //        }

        let zenCall = LogZenCall(
            callId: "call.data.callId",
            callDuration: Date(),
            callEndTime: Date(),
            callType: .voice,
            callStatus: .missed,
            callDirection: .incoming
        )

        print(zenCall.toJSONString())

        initDB()

        let contact = ChatMessage(
            id: "1743362413980",
            message_id: "String",
            room_id: "String",
            zen_call: zenCall,
            is_forwarded: false,
            sender_id: "String",
            created_at: Date(),
            is_deleted: false,
            read_by: "",
            sender_name: "String",
            progress: 0.0,
            is_downloading: false,
            message_created: "wewe",
            message_type: "call",
            reactions: [],
            status: MessageStatus.read
        )

        do {
            try db.updateChatMessage(chatMessage: contact)
        } catch {
            print(db.errorMessage)
        }

        query()
        //        disconnectDB()

        return "call.callId"
    }

    func createCallLog1() -> String? {

        let id = String(Int64(Date().timeIntervalSince1970 * 1000))  // milliseconds since epoch
        let createdAt = String(Int64(Date().timeIntervalSince1970))  // UNIX timestamp
        let messageCreated = ISO8601DateFormatter().string(from: Date())
        let messageType = "call"
        let status = "read"
        var reactions: String = "[]"  // JSON representation of an empty array

        //        let reactionsList: [String] = []  // Empty list
        //        if let jsonData = try? JSONSerialization.data(withJSONObject: reactionsList, options: []),
        //            let jsonString = String(data: jsonData, encoding: .utf8)
        //        {
        //            reactions = jsonString
        //            print("Jogular")
        //            print(jsonString)  // Output: "[]"
        //
        //        }

        let zenCall = LogZenCall(
            callId: "call.data.callId",
            callDuration: Date(),
            callEndTime: Date(),
            callType: .voice,
            callStatus: .ringing,
            callDirection: .incoming
        )

        print(zenCall.toJSONString())

        initDB1()
        // Store in SQLite3 (New)
        let insertQuery =
            "INSERT INTO chat_messages_entity (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at, is_deleted, read_by, sender_name, progress, is_downloading, message_created, message_type, reactions, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"

        //        let insertQuery = """
        //            INSERT INTO chat_messages_entity (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at, is_deleted, read_by, sender_name, progress, is_downloading, message_created, message_type, reactions, status)
        //            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
        //            """
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db1, insertQuery, -1, &statement, nil)
            == SQLITE_OK
        {
            sqlite3_bind_text(
                statement, 1, ("hfggf" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 2, ("bvbv" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 3, ("ere" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement,
                4,
                (zenCall.toJSONString() as NSString).utf8String,
                -1,
                nil
            )
            sqlite3_bind_int(statement, 5, 0)
            sqlite3_bind_text(
                statement, 6, ("dsdsdsdds" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 7, (createdAt as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 8, 0)
            sqlite3_bind_text(
                statement, 9, ("" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 10, ("" as NSString).utf8String, -1, nil)
            sqlite3_bind_double(statement, 11, 0.0)
            sqlite3_bind_int(statement, 12, 0)
            sqlite3_bind_text(
                statement, 13, (messageCreated as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 14, (messageType as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 15, (reactions as NSString).utf8String, -1, nil)
            sqlite3_bind_text(
                statement, 16, (status as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Call log inserted into SQLite.")
            } else {
                print(
                    "Error inserting call log: \(String(cString: sqlite3_errmsg(db1)))"
                )
            }
        }
        sqlite3_finalize(statement)

        query()
        //        disconnectDB()

        return "call.callId"
    }

    func query() {
        initDB1()

        let query = "SELECT * FROM \"chat_messages_entity\";"

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db1, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let columnCount = sqlite3_column_count(statement)
                var rowDict = [String: Any]()

                for i in 0..<columnCount {
                    let columnName = String(
                        cString: sqlite3_column_name(statement, i))
                    let columnText = sqlite3_column_text(statement, i)

                    if let value = columnText {
                        rowDict[columnName] = String(cString: value)
                    } else {
                        rowDict[columnName] = nil
                    }
                }

                print(rowDict)  // Prints each row as a dictionary
            }
        } else {
            print("Error preparing statement")
        }

        sqlite3_finalize(statement)
        sqlite3_close(db1)
    }

}

enum SQLiteError: Error {
    case OpenDatabase(message: String)
    case Prepare(message: String)
    case Step(message: String)
    case Bind(message: String)
}

class SQLiteDatabase {
    // Check this out: https://www.kodeco.com/6620276-sqlite-with-swift-tutorial-getting-started
    private let dbPointer: OpaquePointer?
    private init(dbPointer: OpaquePointer?) {
        self.dbPointer = dbPointer
    }
    deinit {
        sqlite3_close(dbPointer)
    }

    static func open(path: String) throws -> SQLiteDatabase {
        var db: OpaquePointer?
        // 1
        if sqlite3_open(path, &db) == SQLITE_OK {
            // 2
            return SQLiteDatabase(dbPointer: db)
        } else {
            // 3
            defer {
                if db != nil {
                    sqlite3_close(db)
                }
            }
            if let errorPointer = sqlite3_errmsg(db) {
                let message = String(cString: errorPointer)
                throw SQLiteError.OpenDatabase(message: message)
            } else {
                throw
                    SQLiteError
                    .OpenDatabase(
                        message: "No error message provided from sqlite.")
            }
        }
    }

    fileprivate var errorMessage: String {
        if let errorPointer = sqlite3_errmsg(dbPointer) {
            let errorMessage = String(cString: errorPointer)
            return errorMessage
        } else {
            return "No error message provided from sqlite."
        }
    }

}

extension SQLiteDatabase {
    func prepareStatement(sql: String) throws -> OpaquePointer? {
        var statement: OpaquePointer?
        guard
            sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil)
                == SQLITE_OK
        else {
            throw SQLiteError.Prepare(message: errorMessage)
        }
        return statement
    }
}

extension SQLiteDatabase {
    func insertChatMessage(chatMessage: ChatMessage) throws {
        let insertSql =
            "INSERT INTO chat_messages_entity (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at, is_deleted, read_by, sender_name, progress, is_downloading, message_created, message_type, reactions, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"

        let insertStatement = try prepareStatement(sql: insertSql)

        defer {
            sqlite3_finalize(insertStatement)
        }
        //    let name: NSString = contact.name
        let id = String(Int64(Date().timeIntervalSince1970 * 1000))  // milliseconds since epoch
        let createdAt = String(Int64(Date().timeIntervalSince1970))  // UNIX timestamp
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [
            .withInternetDateTime, .withFractionalSeconds,
        ]  // Enables microseconds
        let messageCreated = formatter.string(from: Date())
        print("messageCreated")

        print(messageCreated)

        guard
            sqlite3_bind_text(
                insertStatement,
                1,
                id.utf8(),
                -1,
                nil
            ) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement,
                    2,
                    chatMessage.message_id.utf8(),
                    -1,
                    nil
                ) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 3, chatMessage.room_id.utf8(), -1, nil)
                    == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement,
                    4,
                    chatMessage.zen_call!.toJSONString().utf8(),
                    -1,
                    nil
                ) == SQLITE_OK
                && sqlite3_bind_int(insertStatement, 5, 0) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 6,
                    chatMessage.sender_id
                        .utf8(), -1, nil) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 7,
                    createdAt
                        .utf8(), -1, nil) == SQLITE_OK
                && sqlite3_bind_int(insertStatement, 8, 0) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 9, chatMessage.read_by!.utf8(), -1, nil)
                    == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 10, chatMessage.sender_name.utf8(), -1, nil
                ) == SQLITE_OK
                && sqlite3_bind_double(insertStatement, 11, 0.0) == SQLITE_OK
                && sqlite3_bind_int(insertStatement, 12, 0) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 13, messageCreated.utf8(), -1, nil)
                    == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 14, chatMessage.message_type.utf8(), -1,
                    nil) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 15, "[]".utf8(), -1, nil)
                    == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement, 16, chatMessage.status.rawValue.utf8(), -1,
                    nil) == SQLITE_OK
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("Successfully inserted row.")
    }

    func updateChatMessage(chatMessage: ChatMessage) throws {
        //        let updateStatementString =
        //            "UPDATE Contact SET Name = 'Adam' WHERE Id = 1;"

        //        let insertSql =
        //            """
        //                UPDATE chat_messages_entity
        //                SET message_id = ?, room_id = ?, zen_call = ?, is_forwarded = ?,
        //                    sender_id = ?, is_deleted = ?, read_by = ?,
        //                    sender_name = ?, progress = ?, is_downloading = ?,
        //                    message_type = ?, reactions = ?, status = ?
        //                WHERE id = ?;
        //            """
        let insertSql =
            """
                UPDATE chat_messages_entity 
                SET zen_call = ? WHERE message_id = ?;
            """

        let insertStatement = try prepareStatement(sql: insertSql)

        defer {
            sqlite3_finalize(insertStatement)
        }
        //    let name: NSString = contact.name
        //        let id = String(Int64(Date().timeIntervalSince1970 * 1000))  // milliseconds since epoch
        //        let createdAt = String(Int64(Date().timeIntervalSince1970))  // UNIX timestamp
        //        let messageCreated = ISO8601DateFormatter().string(from: Date())

        //        guard
        //            sqlite3_bind_text(
        //                insertStatement,
        //                1,
        //                chatMessage.message_id.utf8(),
        //                -1,
        //                nil
        //            ) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 2, chatMessage.room_id.utf8(), -1, nil)
        //                    == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement,
        //                    3,
        //                    chatMessage.zen_call!.toJSONString().utf8(),
        //                    -1,
        //                    nil
        //                ) == SQLITE_OK
        //                && sqlite3_bind_int(insertStatement, 4, 0) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 5,
        //                    chatMessage.sender_id
        //                        .utf8(), -1, nil) == SQLITE_OK
        //                && sqlite3_bind_int(insertStatement, 6, 0) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 7, chatMessage.read_by!.utf8(), -1, nil)
        //                    == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 8, chatMessage.sender_name.utf8(), -1, nil
        //                ) == SQLITE_OK
        //                && sqlite3_bind_double(insertStatement, 9, 0.0) == SQLITE_OK
        //                && sqlite3_bind_int(insertStatement, 10, 0) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 11, chatMessage.message_type.utf8(), -1,
        //                    nil) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 12, "[]".utf8(), -1, nil)
        //                    == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement, 13, chatMessage.status.rawValue.utf8(), -1,
        //                    nil) == SQLITE_OK
        //                && sqlite3_bind_text(
        //                    insertStatement,
        //                    14,
        //                    chatMessage.id.utf8(),
        //                    -1,
        //                    nil
        //                ) == SQLITE_OK
        //
        //        else {
        //            throw SQLiteError.Bind(message: errorMessage)
        //        }
        guard
            sqlite3_bind_text(
                insertStatement,
                1,
                chatMessage.zen_call!.toJSONString().utf8(),
                -1,
                nil
            ) == SQLITE_OK
                && sqlite3_bind_text(
                    insertStatement,
                    2,
                    chatMessage.message_id.utf8(),
                    -1,
                    nil
                ) == SQLITE_OK
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("Successfully inserted row.")
    }

}

// ZenCall class
struct LogZenCall: Codable {
    var callId: String?
    var callDuration: Date?
    var callEndTime: Date?
    var callType: LogCallType
    var callStatus: LogCallStatus
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

    func toJSONString() -> String {
        let dictionary: [String: Any] = [
            "callId": callId ?? "",
            "callDuration": callDuration?.iso8601String,
            "callEndTime": callEndTime?.iso8601String,
            "callType": callType.toString(),
            "callStatus": callStatus.toString(),
            "callDirection": callDirection.toString(),
        ]

        if let jsonData = try? JSONSerialization.data(
            withJSONObject: dictionary, options: []),
            let jsonString = String(data: jsonData, encoding: .utf8)
        {
            return jsonString
        }

        return "{}"  // Return an empty JSON object if serialization fails
    }

    // Create a ZenCall instance from a dictionary (fromMap equivalent)
    static func fromDictionary(_ dict: [String: Any]) -> LogZenCall? {
        guard let callTypeString = dict["callType"] as? String,
            let callStatusString = dict["callStatus"] as? String,
            let callDirectionString = dict["callDirection"] as? String
        else {
            return nil
        }

        let callId = dict["callId"] as? String
        let callDuration = (dict["callDuration"] as? String)?.toDate()
        let callEndTime = (dict["callEndTime"] as? String)?.toDate()
        let callType = LogCallType.fromString(callTypeString)
        let callStatus = LogCallStatus.fromString(callStatusString)
        let callDirection = CallDirection.fromString(callDirectionString)

        return LogZenCall(
            callId: callId,
            callDuration: callDuration,
            callEndTime: callEndTime,
            callType: callType,
            callStatus: callStatus,
            callDirection: callDirection
        )
    }
}

enum LogCallStatus: String, Codable {
    case connecting
    case ringing
    case connected
    case missed
    case noAnswer
    case cancelled
    case completed

    // Factory method to create CallStatus from a string
    static func fromString(_ status: String) -> LogCallStatus {
        return LogCallStatus(rawValue: status) ?? .connecting
    }

    // Convert CallStatus to string
    func toString() -> String {
        return self.rawValue
    }
}

// Enum for CallType
enum LogCallType: String, Codable {
    case voice
    case video

    // Factory method to create CallType from a string
    static func fromString(_ type: String) -> LogCallType {
        return LogCallType(rawValue: type) ?? .voice
    }

    // Convert CallType to string
    func toString() -> String {
        return self.rawValue
    }
}

extension String {
    func utf8() -> UnsafePointer<Int8>? {
        return (self as NSString).utf8String
    }
}

// func updateChatMessage(
//     id: String,
//     messageID: String,
//     roomID: String,
//     zenCall: String,
//     isForwarded: Bool,
//     senderID: String,
//     createdAt: Int,
//     isDeleted: Bool,
//     readBy: String?,
//     senderName: String?,
//     progress: Double,
//     isDownloading: Bool,
//     messageCreated: String,
//     messageType: String,
//     reactions: String,
//     status: String
// ) {
//     let dbPath = getDatabasePath()!
//     var config = Configuration()
//     config.publicStatementArguments = true

//     config.prepareDatabase { db in
//         db.trace { print("SQL> \($0)") }
//     }
//     // Logs all executed SQL queries

//     let dbQueue = try! DatabaseQueue(path: dbPath, configuration: config)

//     try! dbQueue.write { db in
//         let sql = """
//         UPDATE chat_messages_entity
//         SET
//           message_id = ?,
//           room_id = ?,
//           zen_call = ?,
//           is_forwarded = ?,
//           sender_id = ?,
//           created_at = ?,
//           is_deleted = ?,
//           progress = ?,
//           is_downloading = ?,
//           message_created = ?,
//           message_type = ?,
//           reactions = ?,
//           status = ?
//         WHERE id = ?;
//         """

//         try db.execute(
//             sql: sql,
//             arguments: [
//                 messageID,
//                 roomID,
//                 zenCall,
//                 isForwarded ? 1 : 0,
//                 senderID,
//                 createdAt,
//                 isDeleted ? 1 : 0,
// //                readBy ?? NSNull(),
// //                senderName ?? NSNull(),
//                 progress,
//                 isDownloading ? 1 : 0,
//                 messageCreated,
//                 messageType,
//                 reactions,
//                 status,
//                 id
//             ]
//         )
//     }
// }

// struct User: Codable, FetchableRecord, PersistableRecord {
//     static let databaseTableName = "users"  // ✅ Changed to "users"
//     var id: Int64?
//     var name: String
//     var email: String
// }

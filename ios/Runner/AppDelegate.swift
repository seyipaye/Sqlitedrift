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
                    self.realmVM.createCallLog()

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
    var db: OpaquePointer?

    private func getDatabasePath() -> String? {
        let fileManager = FileManager.default
        if let dir = fileManager.urls(
            for: .documentDirectory, in: .userDomainMask
        ).first {
            return dir.appendingPathComponent("app.db").path
        }
        return nil
    }

    func initDB() {
        guard let dbPath = getDatabasePath() else {
            print("Error: Could not get database path.")
            return
        }

        if sqlite3_open(dbPath, &db) != SQLITE_OK {
            print("Error opening SQLite database.")
        } else {
            print("SQLite database initialized successfully.")
            //               createTables() // Ensure tables exist
            let sql = "PRAGMA debug = 1;"
            if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK {
                print(
                    "Failed to enable debugging: \(String(cString: sqlite3_errmsg(db)))"
                )
            }
        }
    }

    /// Disconnect from SQLite3 database
    func disconnectDB() {
        if db != nil {
            sqlite3_close(db)
            db = nil
            print("SQLite database closed.")
        }
    }

    func createCallLog() -> String? {

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

        initDB()
        // Store in SQLite3 (New)
        let insertQuery =
            "INSERT INTO chat_messages_entity (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at, is_deleted, read_by, sender_name, progress, is_downloading, message_created, message_type, reactions, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"

        //        let insertQuery = """
        //            INSERT INTO chat_messages_entity (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at, is_deleted, read_by, sender_name, progress, is_downloading, message_created, message_type, reactions, status)
        //            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
        //            """
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK
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
                (
                    zenCall.toJSONString() as NSString
                ).utf8String,
                -1,
                nil
            )
            sqlite3_bind_int(statement, 5, 0)
            sqlite3_bind_text(
                statement, 6, ("dsdsdsdds" as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 7, (createdAt as NSString).utf8String, -1, nil)
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
                    "Error inserting call log: \(String(cString: sqlite3_errmsg(db)))"
                )
            }
        }
        sqlite3_finalize(statement)

        query()
        //        disconnectDB()

        return "call.callId"
    }

    func query() {
        initDB()

        let query = "SELECT * FROM \"chat_messages_entity\";"

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
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
        sqlite3_close(db)
    }

}

enum SQLiteError: Error {
  case OpenDatabase(message: String)
  case Prepare(message: String)
  case Step(message: String)
  case Bind(message: String)
}

class SQLiteDatabase {
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
          throw SQLiteError
            .OpenDatabase(message: "No error message provided from sqlite.")
        }
      }
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
            "callDuration": callDuration?.iso8601String ?? "",
            "callEndTime": callEndTime?.iso8601String ?? "",
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

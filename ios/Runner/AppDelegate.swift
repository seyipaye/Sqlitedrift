import Flutter
import GRDB
import UIKit

func getDatabasePath() -> String? {
    let fileManager = FileManager.default
    if let dir = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        .first
    {
        return dir.appendingPathComponent("app.db").path
    }
    return nil
}

@main
@objc class AppDelegate: FlutterAppDelegate {
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
                    
                    updateChatMessage(
                        id: "2025-03-29T08:ddfs",
                        messageID: "2025-03-29T08:22:22.sdsdf",
                        roomID: "pr678970dd48faf24350f2c3d4 | 67b3342b0afa77c6e2cbb3a8",
                        zenCall: "{ \"callId\": \"pr678970dd48faf24350f2c3d4 | 67b3342b0afa77c6e2cbb3a8Oluwaseyifunmi Ipayedb4b3adc - d755 - 4bd5 - a1bd - 9f7be45c5771\", \"callDuration\": null, \"callEndTime\": null, \"callType\": \"voice\", \"callStatus\": \"cancelled\", \"callDirection\": \"incoming\" }",
                        isForwarded: false,
                        senderID: "678970dd48faf24350f2c3d4",
                        createdAt: 1743260332,
                        isDeleted: false,
                        readBy: nil,
                        senderName: nil,
                        progress: 0.0,
                        isDownloading: false,
                        messageCreated: "2025-03-29T14:58:52.112419Z",
                        messageType: "call",
                        reactions: "[]",
                        status: "read"
                    )

                    
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

func addUser(name: String, email: String) {
    let dbPath = getDatabasePath()!
    var config = Configuration()
    config.publicStatementArguments = true

    config.prepareDatabase { db in
        db.trace { print("SQL> \($0)") }
    }
    // Logs all executed SQL queries

    let dbQueue = try! DatabaseQueue(path: dbPath, configuration: config)

    //    dbQueue.trace { event in
    //            print("SQL Executed: \(event)")
    //        }

    print("User added successfully!")

    //    do {
    //        try dbQueue.write { db in
    //            let user = User(name: name, email: email)
    //            try user.insert(db)
    //        }
    //        print("User added successfully!")
    //    } catch {
    //        print("Failed to add user: \(error)")
    //    }

    do {
        let zenCall = ZenCall(
            callId: "12345",
            callType: CallType.voice,
            callStatus: CallStatus.connecting,  // Added comma
            callDirection: CallDirection.incoming  // Added comma
        )

        let jsonData = try JSONEncoder().encode(zenCall)
        if let jsonString = String(data: jsonData, encoding: .utf8) {

            //                        print(jsonString)

            // I've tried my best to recreate a class with the SDK, but all effort seem to not work
            // I tried re ordering, and the SQL Statments are the same yet it crashes the DB

            // Insert into the database
            try dbQueue.write { db in
                //                let chatMessage = ChatMessage(
                //                    id: UUID().uuidString,
                //                    message_id: UUID().uuidString,
                //                    room_id: "room1",
                //                    zen_call: jsonString,  // Ensure `jsonString` is correctly assigned
                //                    is_forwarded: false,
                //                    sender_id: "user1",
                ////                    sent_at: Date(),
                //                    created_at: Date(),
                //                    is_deleted: false,
                //                    read_by: "gjjhjh",
                //                    sender_name: "User 1",
                //                    progress: 0.0,
                //                    is_downloading: false,
                //                    message_created: "2025-03-29",
                //                    message_type: "text",
                //                    reactions: [],
                //                    status: .sent
                //                )
                //                try chatMessage.insert(db)
                //
                let reactionsData = try JSONEncoder().encode([String]())  // Empty array as JSON

                let sql = """
                    INSERT INTO chat_messages_entity
                    (id, message_id, room_id, zen_call, is_forwarded, sender_id, created_at,
                    is_deleted, read_by, sender_name, progress, is_downloading, message_created,
                    message_type, reactions, status)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                    """

                let args: [DatabaseValueConvertible] = [
                    "2025-03-29T08:ddfs",  // id
                    "2025-03-29T08:22:22.sdsdf",  // message_id
                    "ffsfsfsfsf dfdf",  // room_id
                    jsonString,  // zen_call (encoded as Base64 string)
                    0,  // is_forwarded
                    "sfsfsfsfsfsfsf",  // sender_id
                    1_743_232_942,  // created_at (assuming it's a timestamp)
                    0,  // is_deleted
                    "",  // read_by (empty string for now)
                    "",  // sender_name (empty string)
                    0.0,  // progress
                    0,  // is_downloading
                    "2025-03-29T07:22:22.125803Z",  // message_created
                    "call",  // message_type
                    String(data: reactionsData, encoding: .utf8)!,  // Empty array as JSON string
                    "read",  // status
                ]

                try db.execute(sql: sql, arguments: StatementArguments(args))
            }
        }
    } catch {
        print("Error encoding ZenCall or inserting chat message: \(error)")
    }

}

func updateChatMessage(
    id: String,
    messageID: String,
    roomID: String,
    zenCall: String,
    isForwarded: Bool,
    senderID: String,
    createdAt: Int,
    isDeleted: Bool,
    readBy: String?,
    senderName: String?,
    progress: Double,
    isDownloading: Bool,
    messageCreated: String,
    messageType: String,
    reactions: String,
    status: String
) {
    let dbPath = getDatabasePath()!
    var config = Configuration()
    config.publicStatementArguments = true

    config.prepareDatabase { db in
        db.trace { print("SQL> \($0)") }
    }
    // Logs all executed SQL queries

    let dbQueue = try! DatabaseQueue(path: dbPath, configuration: config)

    try! dbQueue.write { db in
        let sql = """
        UPDATE chat_messages_entity 
        SET 
          message_id = ?, 
          room_id = ?, 
          zen_call = ?, 
          is_forwarded = ?, 
          sender_id = ?, 
          created_at = ?, 
          is_deleted = ?, 
          progress = ?, 
          is_downloading = ?, 
          message_created = ?, 
          message_type = ?, 
          reactions = ?, 
          status = ? 
        WHERE id = ?;
        """

        try db.execute(
            sql: sql,
            arguments: [
                messageID,
                roomID,
                zenCall,
                isForwarded ? 1 : 0,
                senderID,
                createdAt,
                isDeleted ? 1 : 0,
//                readBy ?? NSNull(),
//                senderName ?? NSNull(),
                progress,
                isDownloading ? 1 : 0,
                messageCreated,
                messageType,
                reactions,
                status,
                id
            ]
        )
    }
}


struct User: Codable, FetchableRecord, PersistableRecord {
    static let databaseTableName = "users"  // ✅ Changed to "users"
    var id: Int64?
    var name: String
    var email: String
}

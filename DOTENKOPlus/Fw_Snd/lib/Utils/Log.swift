/**
ログに関して
 
 */

import Foundation

enum LogLevel: Int {
    case info = 1
    case debug = 2
    case warning = 3
    case error = 4
}

func log(_ message: String, level: LogLevel = .info) {
    #if DEBUG
    if level.rawValue >= config.currentLogLevel.rawValue {
        var prefix: String
        switch level {
        case .info:
            prefix = "[INFO]"
        case .debug:
            prefix = "[DEBUG]"
        case .warning:
            prefix = "[WARNING]"
        case .error:
            prefix = "[ERROR]"
        }
        
        print("\(Date.currentTime) \(prefix) \(message)")

    }
    #endif
}

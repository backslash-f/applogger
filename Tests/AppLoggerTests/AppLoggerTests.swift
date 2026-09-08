import XCTest

@testable import AppLogger

final class AppLoggerTests: XCTestCase {
    func testDefaultLevelIsDefault() {
        XCTAssertEqual(AppLogger.Defaults.level, .default)
    }

    func testAppLogLevelMapping() {
        XCTAssertEqual(AppLogLevel.debug.osLogType, .debug)
        XCTAssertEqual(AppLogLevel.info.osLogType, .info)
        XCTAssertEqual(AppLogLevel.default.osLogType, .default)
        XCTAssertEqual(AppLogLevel.error.osLogType, .error)
        XCTAssertEqual(AppLogLevel.fault.osLogType, .fault)
    }
}

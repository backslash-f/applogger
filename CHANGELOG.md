# Changelog

All notable changes to this project are documented in this file.

## [1.1.1] - 2026-09-09

### Changed

- Updated AgentGuidelines from `0.0.9` to `0.0.27`, adopted its consumer contracts and audit integration, and added shared Swift formatting validation to CI.

### Fixed

- Lowered the minimum Swift tools version from `6.4` to `6.3.3` so Xcode Cloud environments using Swift `6.3.3` can resolve the package. Public APIs and platform requirements are unchanged.

## [1.1.0] - 2026-07-21

### Added

- Public `Date.formattedLogTimestamp()` and `TimeInterval.formattedLogDuration()` helpers for consistent logging output.
- Shared ThatFactory agent guidelines for package maintenance and contributions.
- DocC API documentation published to GitHub Pages as part of the release workflow.

### Changed

- Moved logging-formatting helpers into the AppLogger package.

//! DCommon
//!
//! Author : farey0

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const DCommon = b.addModule("DCommon", .{
        .root_source_file = b.path("src/DCommon.zig"),
        .target = target,
        .optimize = optimize,
    });

    const DCommonUnitTests = b.addTest(.{
        .root_source_file = b.path("src/Test.zig"),
        .target = target,
        .optimize = optimize,
    });
    const UnitTestRun = b.addRunArtifact(DCommonUnitTests);
	
    DCommonUnitTests.root_module.addImport("DCommon", DCommon);

    const TestStep = b.step("test", "Run unit tests");
    TestStep.dependOn(&UnitTestRun.step);
}

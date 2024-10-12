//! DCommon
//!
//! Author : farey0

pub const DCommon = @import("DCommon");

test {
    @import("std").testing.refAllDecls(@This());
}

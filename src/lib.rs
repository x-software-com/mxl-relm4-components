pub mod gtk;
mod localization;
pub mod misc;

#[cfg(feature = "create_report_dialog")]
pub mod create_report_dialog;

#[cfg(feature = "problem_report_dialog")]
pub mod problem_report_dialog;

pub use misc::init;

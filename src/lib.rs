pub extern crate relm4;
pub extern crate relm4_components;

pub mod gtk;
mod localization;

pub fn init() {
    localization::init();
    #[cfg(feature = "third_party_licenses_dialog")]
    relm4_icons::initialize_icons();
}

#[cfg(feature = "third_party_licenses_dialog")]
pub mod third_party_licenses_dialog;

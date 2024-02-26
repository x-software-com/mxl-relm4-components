use relm4::prelude::DynamicIndex;

#[derive(Debug)]
pub enum ThirdPartyLicensesComponentInput {
    Activate(usize),
    Switch(DynamicIndex),
    PrivateMessage(internal::PrivateMsg),
}

pub(super) mod internal {
    #[derive(Debug)]
    pub enum PrivateMsg {
        RequestClose,
    }
}

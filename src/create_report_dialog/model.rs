use relm4::Controller;
use relm4_components::save_dialog::SaveDialog;

#[derive(Debug)]
pub struct CreateReportDialogInit {}

#[derive(Debug)]
pub struct CreateReportDialog {
    pub(super) file_name: String,
    pub(super) file_chooser: Controller<SaveDialog>,
}

impl CreateReportDialog {}

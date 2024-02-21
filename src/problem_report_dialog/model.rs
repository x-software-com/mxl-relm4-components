use relm4::Controller;
use relm4_components::save_dialog::SaveDialog;

#[derive(Debug)]
pub struct ProblemReportDialogInit {}

#[derive(Debug)]
pub struct ProblemReportDialog {
    pub(super) file_name: String,
    pub(super) file_chooser: Controller<SaveDialog>,
}

impl ProblemReportDialog {}

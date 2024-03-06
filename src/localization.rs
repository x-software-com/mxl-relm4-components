use i18n_embed::{
    fluent::{fluent_language_loader, FluentLanguageLoader},
    DefaultLocalizer, DesktopLanguageRequester, LanguageLoader, Localizer,
};
use once_cell::sync::Lazy;
use rust_embed::RustEmbed;

#[derive(RustEmbed)]
#[folder = "i18n/"]
struct Localizations;

#[allow(dead_code)]
pub(crate) static LANGUAGE_LOADER: Lazy<FluentLanguageLoader> = Lazy::new(|| {
    let loader = fluent_language_loader!();
    loader
        .load_fallback_language(&Localizations)
        .expect("Error while loading fallback language");

    let localizer = DefaultLocalizer::new(&loader, &Localizations);
    let requested_languages = DesktopLanguageRequester::requested_languages();
    if let Err(error) = localizer.select(&requested_languages) {
        log::error!("Error while loading language: {error}");
    }
    loader
});

pub(crate) mod helper {
    #[allow(unused_macros)]
    macro_rules! fl {
        ($message_id:literal) => {{
            i18n_embed_fl::fl!($crate::localization::LANGUAGE_LOADER, $message_id)
        }};

        ($message_id:literal, $($args:expr),*) => {{
            i18n_embed_fl::fl!($crate::localization::LANGUAGE_LOADER, $message_id, $($args), *)
        }};
    }

    #[allow(unused_imports)]
    pub(crate) use fl;
}

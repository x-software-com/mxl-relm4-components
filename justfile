#!/usr/bin/env -S just --justfile
#
# To run this script, you must have installed the Just command runner. Execute:
# $ cargo install --locked just

#
# Setup the environment:
#

setup-cargo-hack:
    cargo install --locked cargo-hack

setup-cargo-audit:
    cargo install --locked cargo-audit

setup: setup-cargo-hack setup-cargo-audit
    git config pull.rebase true
    git config branch.autoSetupRebase always
    cargo install --locked typos-cli
    cargo install --locked cocogitto
    cog install-hook --overwrite commit-msg
    @echo "Done"

#
# Recipes for test and linting:
#

test-options := ""

test:
    cargo test --no-fail-fast --workspace --all-features --all-targets -- {{test-options}}

test-verbose:
    just --justfile {{justfile()}} test-options="--nocapture" test

ci-test:
    xvfb-run --auto-servernum --server-args="-screen 0 800x600x24" just --justfile {{justfile()}} test-verbose

hack:
    cargo install cargo-hack
    cargo hack --feature-powerset --no-dev-deps check

audit:
    cargo install cargo-audit
    cargo audit

clippy:
    cargo clippy --quiet --release --all-targets --all-features

cargo-fmt:
    cargo fmt --all

cargo-fmt-check:
    cargo fmt --check

#
# Misc recipes:
#

clean:
    cargo clean
    rm -rf vcpkg_installed vcpkg

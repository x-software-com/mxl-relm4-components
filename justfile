#!/usr/bin/env -S just --justfile

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

clean:
    cargo clean
    rm -rf vcpkg_installed vcpkg

#!/usr/bin/env -S just --justfile

test:
    cargo test --no-fail-fast --workspace --all-features --all-targets

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

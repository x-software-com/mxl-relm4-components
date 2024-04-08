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

mxl-env:
    ./mxl-env.py --print-env --no-export-print-env > .mxl-env
    @echo "Created '.mxl-env' file"

clean:
    cargo clean
    rm -rf vcpkg_installed vcpkg

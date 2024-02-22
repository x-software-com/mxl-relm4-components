#!/usr/bin/env -S just --justfile

test:
    cargo test --no-fail-fast --workspace --locked --all-features --all-targets

hack:
    cargo hack --feature-powerset check

audit:
    cargo install cargo-audit
    cargo audit

clippy:
    scripts/clippy.sh

mxl-env:
    ./mxl-env.py --print-env --no-export-print-env > .mxl-env
    @echo "Created '.mxl-env' file"

clean:
    cargo clean
    rm -rf vcpkg_installed vcpkg

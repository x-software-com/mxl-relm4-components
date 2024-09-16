#!/usr/bin/env python3
"""Script to install tools and build VCPKG third party libraries"""

import argparse

from scripts.shared.setup import setup_tools


def setup():
    """Parse command line and call setup functions"""
    parser = argparse.ArgumentParser(description='Setup mxl environment')
    parser.add_argument('--ci', dest='ci', action=argparse.BooleanOptionalAction, default=False, help='Setup for CI pipeline')
    options = parser.parse_args()

    setup_tools(options.ci)


if __name__ == "__main__":
    setup()

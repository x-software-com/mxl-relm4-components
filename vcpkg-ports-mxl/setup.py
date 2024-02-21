#!/usr/bin/env python3
"""Script to install tools and setup development environment"""

import os
import subprocess

def setup_git():
    """Setup git for development"""
    subprocess.run(['git', 'config', 'pull.rebase', 'true'], check = True)
    subprocess.run(['git', 'config', 'branch.autoSetupRebase', 'always'], check = True)


def install_cocogitto():
    """Install cocogitto for conventional commits and version bumping"""
    print("Install cocogitto...")
    subprocess.run(['cargo', 'install', 'cocogitto'], check = True)


def setup_cocogitto():
    """Setup cocogitto for development use"""
    print("Setup cocogitto...")
    subprocess.run(['cog', 'install-hook', '--overwrite', 'commit-msg'], check = True)


def setup():
    """Install and setup all tools"""
    setup_git()

    install_cocogitto()
    setup_cocogitto()


if __name__ == "__main__":
    setup()

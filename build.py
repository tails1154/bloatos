#!/usr/bin/env python3
"""
BLOAT OS ISO Build System
The MOST BLOATED Arch Derivative
"""

import os
import sys
import subprocess
import shutil
from pathlib import Path
from datetime import datetime

SCRIPT_DIR = Path(__file__).parent.resolve()
ISO_DIR = SCRIPT_DIR / ".." / "bloatos-iso" / "archiso"
BUILD_DIR = Path.home() / "bloatos-build"
OUT_DIR = Path.home() / "bloatos-iso-out"
ARCHISO_VERSION = "archiso 83-1"


def run_cmd(cmd, check=True, **kwargs):
    """Run a shell command."""
    print(f"[CMD] {cmd}")
    result = subprocess.run(cmd, shell=True, check=check, **kwargs)
    return result


def check_archiso():
    """Check if archiso is installed and correct version."""
    try:
        result = subprocess.run(["pacman", "-Q", "archiso"], capture_output=True, text=True)
        current_version = result.stdout.strip()
    except Exception:
        current_version = "not installed"

    if current_version != ARCHISO_VERSION:
        print(f"WARNING: archiso version mismatch!")
        print(f"  Expected: {ARCHISO_VERSION}")
        print(f"  Installed: {current_version}")
        print(f"  This may or may not work. Continuing anyway...")
    return True


def install_archiso():
    """Install archiso if not present."""
    result = subprocess.run(["pacman", "-Qi", "archiso"], capture_output=True)
    if result.returncode != 0:
        print("[INFO] Installing archiso...")
        run_cmd("sudo pacman -S --noconfirm archiso")


def clean_build_dir():
    """Clean and prepare build directory."""
    print("[Phase 1] Preparing build environment...")
    if BUILD_DIR.exists():
        print("  Cleaning old build directory...")
        shutil.rmtree(BUILD_DIR)
    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    OUT_DIR.mkdir(parents=True, exist_ok=True)


def copy_profile():
    """Copy archiso profile to build directory."""
    print("[Phase 2] Copying BLOAT OS archiso profile...")
    dest = BUILD_DIR / "archiso"
    shutil.copytree(
        ISO_DIR, dest,
        symlinks=True,
        ignore_dangling_symlinks=True,
        dirs_exist_ok=True
    )


def configure_mkarchiso():
    """Make mkarchiso verbose."""
    print("[Phase 3] Configuring mkarchiso...")
    run_cmd('sudo sed -i \'s/quiet="y"/quiet="n"/g\' /usr/bin/mkarchiso', check=False)


def build_iso():
    """Build the ISO using mkarchiso."""
    print("[Phase 4] Building BLOAT OS ISO...")
    print("This will take a while. Go get a snack.")
    print("")

    archiso_path = BUILD_DIR / "archiso"
    cmd = f"sudo mkarchiso -v -w {BUILD_DIR} -o {OUT_DIR} {archiso_path}"
    run_cmd(cmd)


def report_results():
    """Report build results."""
    print("")
    print("=" * 40)
    print("  BLOAT OS Build Complete!")
    print("=" * 40)
    print("")
    print(f"ISO output directory: {OUT_DIR}")

    isos = list(OUT_DIR.glob("*.iso"))
    if isos:
        for iso in isos:
            size_mb = iso.stat().st_size / (1024 * 1024)
            print(f"  {iso.name} ({size_mb:.1f} MB)")
    else:
        print("  No ISO found (build may have failed)")

    print("")
    print("To burn to USB:")
    print("  sudo dd if=<iso> of=/dev/sdX bs=4M status=progress")
    print("")


def main():
    print("=" * 40)
    print("  BLOAT OS ISO Builder")
    print("  The MOST BLOATED Arch Derivative")
    print("=" * 40)
    print("")

    # Check archiso
    check_archiso()
    install_archiso()

    # Clean and prepare
    clean_build_dir()

    # Copy profile
    copy_profile()

    # Configure mkarchiso
    configure_mkarchiso()

    # Build
    build_iso()

    # Report
    report_results()

    return 0


if __name__ == "__main__":
    sys.exit(main())

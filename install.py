#!/usr/bin/env python3
"""
Bootstrap script 
"""
import argparse
import configparser
import os
import subprocess

from collections.abc import Iterable


REPO_URL = "https://github.com/fedusia/common-dot-files"

ROOT_WORKING_DIR = "work"
SUBDIRS = ("src", "venvs", "tmp", "bin", "stands", "terraform")
ENV_FILES = ("bash_profile", "gitconfig", "tmux.conf", "vimrc")
DEFAULT_PACKAGES = ("pyenv", "pyenv-virtualenv", "imagemagick")


def get_root_working_dir():
    home_path = os.path.expanduser("~")
    return os.path.join(home_path, ROOT_WORKING_DIR)


def create_working_tree(root_working_dir=ROOT_WORKING_DIR, subdirs=SUBDIRS):
    home_path = os.path.expanduser("~")
    for d in subdirs:
        subdir = os.path.join(home_path, root_working_dir, d)
        os.makedirs(subdir, exist_ok=True)
    print(f"working tree created: {os.path.join(home_path, root_working_dir)}")


def install_brew_if_not_exists():
    if not os.uname().sysname == "Darwin":
        print('Not Darwing, Skip installing brew')
        return
    brew_install_file = "brew_install.sh"
    if os.path.exists("/opt/homebrew/bin/brew"):
        print("brew already installed. Skipping installation")
        return
    print("Installing brew")
    subprocess.run(
        [
            "curl",
            "-o",
            "brew_install_file",
            "-f",
            "-s",
            "-S",
            "-L",
            "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh",
        ]
    )
    subprocess.run(["chmod", "+x", "brew_install_file"])
    subprocess.run(["/bin/bash", "-c", "./brew_install_file"])


def update_brew():
    if os.uname().sysname == 'Linux':
        return
    print("Updating brew")
    subprocess.run(["brew", "update"])


def clone_repo(repo=REPO_URL):
    repo = repo.split("/")
    print(repo)
    repo_site, repo_name = repo[2], repo[4]
    site_path = os.path.join(os.path.expanduser("~"), ROOT_WORKING_DIR, "src", repo_site)
    full_repo_path = os.path.join(site_path, repo_name)
    if not os.path.exists(site_path):
        print(f"{site_path }Path does not exist. Creating it")
    if not os.path.exists(os.path.join(site_path, repo_name)):
        print(site_path, repo_name)
        subprocess.run(["git", "clone", repo, site_path])
    else:
        subprocess.run(["git", "pull", full_repo_path])


def create_links_to_common_files_if_not_exist(recreate=False):
    root_working_path = get_root_working_dir()
    for common_file in ENV_FILES:
        src_path = os.path.join(root_working_path, "src", "github.com", "common-dot-files", common_file)
        dst_path = os.path.join(os.path.expanduser("~"), f".{common_file}")
        print(src_path)
        if not os.path.islink(dst_path):
            print(f"{dst_path} does not exist. Creating it.")
            os.symlink(src_path, dst_path)
        else:
            print(f"{dst_path} already exists")
            if recreate:
                print(f"Force flag specified. Recreating {dst_path}")
            os.unlink(dst_path)
            os.symlink(src_path, dst_path)


def install_packages(pkgs):
    if isinstance(pkgs, Iterable) is False:
        pkgs = [pkgs]
    if os.uname().sysname == 'Linux':
        for pkg in pkgs:
            subprocess.run(["apt-get", "install", pkg])

    else:
        # TODO: add check if already installed
        for pkg in pkgs:
            subprocess.run(["brew", "install", pkg])


def configure_vim():
    home_path = os.path.expanduser("~")
    vundle_path = ".vim/bundle/Vundle.vim"

    if not os.path.exists(os.path.join(home_path, vundle_path)):
        print("Installing vundle")
        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/VundleVim/Vundle.vim.git",
                os.path.join(home_path, vundle_path),
            ]
        )
        subprocess.run(["vim", "+PluginInstall", "+qall"])
    if not os.path.exists(os.path.join(home_path, "work", "venvs", "vim")):
        subprocess.run(["virtualenv", "-p", "python3", os.path.join(home_path, "work", "venvs", "vim")])
    subprocess.run(
        [
            os.path.join(home_path, "work", "venvs", "vim", "bin", "pip3"),
            "install",
            "pylint",
            "black",
            "pycodestyle",
            "mypy",
        ]
    )
    pylintrc = configparser.ConfigParser()
    pylintrc["FORMAT"] = {"max-line-length": 120}
    with open(os.path.join(home_path, ".pylintrc"), "w") as pylint_config:
        pylintrc.write(pylint_config)


def install_vim_fonts():
    home_path = os.path.expanduser("~")
    fonts_path = "work/github.com/fonts"
    if not os.path.exists(os.path.join(home_path, fonts_path)):
        print("Installing fonts")
        cmd = f"git clone https://github.com/powerline/fonts {home_path}/{fonts_path}"
        subprocess.run(cmd.split())

    print(
        """
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !!!!!!!!!!!  You should manually change font to one of just installed.  !!!!!!!!!!!!!!!!!!!!
          !!!!!!!!!!!  Open iTerm2->Profiles->Edit Profile->Text->Fonts           !!!!!!!!!!!!!!!!!!!!
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          """
    )


def parse_args():
    parser = argparse.ArgumentParser(description="simple environment configuration")
    parser.add_argument(
        "-f",
        "--force",
        action="store_true",
        default=False,
        help="recreate links to common files if needed",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    create_working_tree(ROOT_WORKING_DIR, SUBDIRS)
    install_brew_if_not_exists()
    update_brew()
    clone_repo(REPO_URL)
    create_links_to_common_files_if_not_exist(args.force)
    install_packages("vim")
    install_vim_fonts()
    configure_vim()
    install_packages(DEFAULT_PACKAGES)


if __name__ == "__main__":
    main()

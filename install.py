#!/usr/bin/env python3

import platform
import os
import subprocess


REPO = 'https://github.com/fedusia/common-dot-files'
WORKING_DIR = 'test'
ENV_FILES = ['bashrc', 'vimrc', 'gitconfig']


def get_osname():
    return platform.system()


def get_cwd():
    return os.getcwd()


def create_env_root_dir():
    home_dir = os.path.expanduser("~")
    env_dir = home_dir + '/' + WORKING_DIR
    os.makedirs(env_dir, exist_ok=True)
    return env_dir


def main():
    env_dir = create_env_root_dir()
    if get_cwd() is not env_dir:
        os.chdir(env_dir)
        os.makedirs('src/github.com', exist_ok=True)
        try:
            subprocess.run(['git', 'clone', REPO, './src/github.com/fedusia/common-dot-files'])
        except subprocess.CalledProcessError as err:
            print(err)
        for file in ENV_FILES:
            if get_osname() == 'Darwin' and file == 'bashrc':
                try:
                    os.symlink(env_dir + '/src/github.com/fedusia/common-dot-files/' + file, '../.bash_profile')
                except os.error as err:
                    print('Link to {0} already exists: '.format(file), err.strerror)
                    continue
            try:
                os.symlink(env_dir + '/src/github.com/fedusia/common-dot-files/' + file, '../.' + file)
            except os.error as err:
                print('Link to {0} already exists: '.format(file), err.strerror)

if __name__ == '__main__':
    main()

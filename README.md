# common-dot-files
git clone https://github.com/fedusia/common-dot-files.git
cd common-dot-files
for file in bashrc gitconfig ; do
    cp $file ~/.$file
done

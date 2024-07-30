# .Dotfiles

Installation
------------

Requirements: `gnu stow`

Clone Dotfiles:

```bash
git clone https://github.com/Driuthorn/DotFiles.git
```

Go into the cloned repo folder:

```bash
cd DotFiles
```
Use gnu stow import the configuration:

```bash
stow {folder}
```
If you already have a config file for the package you're going to install,
it's recommended to do a backup of the folder/file. Then, run the following command:

```bash
stow -D {folder} -S {repo_folder}
```

This command will try to delete your actual files/folder and then unpack the repo files

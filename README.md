# 📁 Unwrap: A plugin for ZSH

This simple plugin allows you to remove a directory without removing its contents.

## Usage

In your `zsh` command line, navigate into the directory you want to unwrap,
then type `unwrap`. You will be given a prompt to confirm the action and if you
confirm, unwrap will remove the current directory and move all of its contents
into the parent folder.

## Installation

If you are using oh-my-zsh:

Copy the unwrap folder to `.oh-my-zsh/custom/plugins`, for example:

```bash
cd ~/.oh-my-zsh/custom/plugins
git clone git@github.com:foxleigh81/unwrap-zsh-plugin.git unwrap
```

Enable the plugin in your `.zshrc` file. Edit `~/.zshrc` to activate the plugin, for example: `plugins=(unwrap)`
And restart the terminal to apply (or just type `source ~/.zshrc`).


## Protected Directories

Unwrap will not remove any directories that are in the root of your system 
(or any directory with the same name as one of those folders). Nor will it 
remove the users home directory.

You can add custom-protected directories by creating an `.unwrap` file in your
home directory. The file should contain a list of directories to protect.

An example of a `.unwrap` file can be found in the plugin install directory.

If your folder is not covered by the above, use `unwrap` with caution.

### A warning about folder names

`Unwrap` protection is case-sensitive and will not protect folders that have a space, dash
or other special character in their name. It will, however, work fine with
folders that have an underscore in their name.

## Support

If you like this plugin, I'm glad. I just wanted to make something useful :) However, if you wanted to buy me a coffee, I certainly won't say no.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/I3I21FRCN)


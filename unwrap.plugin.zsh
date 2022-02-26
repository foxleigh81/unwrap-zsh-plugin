#!/bin/zsh
# Copies the contents of the current directory into the parent 
# directory and then deletes the current directory
unwrap() {
  local this_dir=`basename $PWD`;
  local sys_dirs=`ls /`;
  local in_sys_dir=`echo ${sys_dirs[@]} | grep -o $this_dir | wc -w`;
  
  if [ -e "$HOME/.unwrap" ]; then
    local user_protected_dirs=`cat $HOME/.unwrap`;
    local in_user_protected_dirs=`echo ${user_protected_dirs[@]} | grep -o $this_dir | wc -w`;
  else;
    local in_user_protected_dirs=0;
  fi;  
  
  # Check for dangerous directories
  if [[ $this_dir == '/' ]]; then
    echo "\033[38;5;124mRoot directory detected. Aborting.";
    return 0;
  elif [[ in_sys_dir -gt 0 ]]; then
    echo "\033[38;5;124mSystem directory detected. Aborting.";
    return 0;
  elif [[ in_user_protected_dirs -gt 0 ]]; then
    echo "\033[38;5;124mUser protected directory detected. Aborting.";
    return 0;
  elif [[ $this_dir == `basename $HOME` ]]; then
    echo "\033[38;5;124mHome directory detected. Aborting.";
    return 0;
  else
    # The usual suspect have been eliminated. Proceed with a warning.
    echo "\n\033[38;5;124mWarning:\n"
    echo "\033[38;5;024mThis will move all files into the parent directory"
    echo "and then delete this folder.\n"
    echo "\033[38;5;124mExisting files will be overwritten.\n"
    
    echo -n "\033[38;5;024mDo you wish to proceed? (y/N)\n\033[0m";
    
    read response;
    
    # Check to see if the directory is empty
    if [[ $response == "y" ]]; then
      if [ -z "$(ls -A)" ]; then
        # Empty directory. Move into parent directory and delete
        echo "\n⚙️ \033[38;5;144m No files to move. Proceeding.\033[0m";
      else
        echo "\n⚙️ \033[38;5;144m Moving files"
        cp -r * ../
      fi
      echo "\n✅ \033[38;5;118mFiles moved, removing directory"
      cd ..
      rm -rf $this_dir
    fi
    return 1
  fi
}

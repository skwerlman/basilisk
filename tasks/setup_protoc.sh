#!/usr/bin/env zsh

if [[ $(which asdf) ]]; then
  echo "Reshimming asdf..."
  asdf reshim
  echo "If warnings about masking executables in your path appeared, you can safely ignore them."
fi

if [[ ! $(which protoc-gen-elixir) ]]; then
  shell=${SHELL##*/}

  case $shell in
    bash )
      echo "PATH=$PATH:$HOME/.mix/escripts" >>"$HOME/.bashrc"
      ;;
    fish )
      echo "set -gx PATH $PATH $HOME/.mix/escripts" >>"$HOME/.config/fish/config.fish"
      ;;
    zsh )
      echo "PATH=$PATH:$HOME/.mix/escripts" >>"$HOME/.zshrc"
      ;;
    * )
      echo "Your shell is not fully supported by this setup script."
      echo "Open an issue about it, and in the mean time add"
      echo "$HOME/.mix/escripts"
      echo "to your path."
      echo ""
      echo "Include the following info in your issue:"
      echo "SHELL=$SHELL"
  esac
fi

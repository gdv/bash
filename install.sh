#!/usr/bin/bash 

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
git clone https://github.com/gdv/bash.git ~/.bash
cd ~/.bash
cp bashrc ~/.bashrc



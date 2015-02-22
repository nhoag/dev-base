# DOCKER-VERSION	1.5.0

FROM nhoag/git
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

RUN apt-get update && \
  apt-get install -y curl vim zsh && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
  echo "execute pathogen#infect()\nsyntax on\nfiletype plugin indent on" > ~/.vimrc && \
  git clone --depth=1 https://github.com/rking/ag.vim.git ~/.vim/bundle/ag && \
  git clone --depth=1 https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim && \
  git clone --depth=1 https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree && \
  git clone --depth=1 https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular && \
  git clone --depth=1 https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim && \
  git clone --depth=1 https://github.com/vim-scripts/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils && \
  git clone --depth=1 https://github.com/bling/vim-airline.git ~/.vim/bundle/vim-airline && \
  git clone --depth=1 https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible && \
  git clone --depth=1 https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate && \
  git clone --depth=1 https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets && \
  git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround && \
  chsh -s /bin/zsh && \
  git clone --depth=1 --recursive https://github.com/sorin-ionescu/prezto.git /root/.zprezto && \
  for rc in /root/.zprezto/runcoms/z* ; do ln -s "${rc}" "/root/.$(basename $rc)" ; done && \
  exec zsh && setopt EXTENDED_GLOB && \
  sed -i 's/nano/vi/g' /root/.zprofile

ADD vimrc /root/.vimrc
ADD zshrc /root/.zshrc

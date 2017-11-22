FROM haskell:8

# install some missing packages
RUN apt-get update && apt-get install -y make xz-utils

# enable stack tab-completion in bash
RUN echo 'eval "$(stack --bash-completion-script stack)"' >> ~/.bashrc

# choose a project directory
RUN mkdir /usr/local/src/app
WORKDIR /usr/local/src/app

# install ghc
COPY stack.yaml .
RUN stack setup

# build dependencies
COPY *.cabal .
RUN stack build --only-dependencies --test --haddock --bench

# build the app
COPY . .
RUN stack build --test --haddock --bench

CMD bash

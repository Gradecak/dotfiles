export ESHELL=/bin/zsh
export SHELL=/bin/zsh
[ -f "/Users/makigradecak/.ghcup/env" ] && source "/Users/makigradecak/.ghcup/env" # ghcup-env
# export CLOUDSDK_PYTHON="/usr/bin/python3"
export PATH=$PATH:$HOME/.local/bin
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH=${PATH}:`go env GOPATH`/bin
export CONTAINER_USER="$UID:$GID"

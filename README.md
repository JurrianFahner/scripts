# scripts

This repo contains convenient scripts to be used for development. 

## git-related

[`create-hook.sh`](./create-hook.sh) is a script that can create a [git hook](https://git-scm.com/docs/githooks). 

This script can be used in two ways:
1. To be downloaded and put on PATH, so it can be used within git repositories. The help function can be invoked by just running the script. 
2. To be run directly by using a curl command:
   ```bash
   # To run the build.sh command after a git commit is performed (the script tests whether the command exists).
   curl -sS https://jurrianfahner.github.io/scripts/create-hook.sh | bash -s  build.sh
   ```

   Another example with another hook:
   ```bash
   # To run the lint.sh command before a git commit is performed
   curl -sS https://jurrianfahner.github.io/scripts/create-hook.sh | bash -s pre-commit lint.sh
   ```

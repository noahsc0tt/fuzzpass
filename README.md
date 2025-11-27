# fuzzpass

Fuzzily interact with [lastpass-cli](https://github.com/lastpass/lastpass-cli)

## Requirements

- [lastpass-cli](https://github.com/lastpass/lastpass-cli)
- [fzf](https://github.com/junegunn/fzf)

## Installation

This is just a bash script, so:

1. Clone this repository
    ```sh
    git clone https://github.com/noahsc0tt/fuzzpass
    cd fuzzpass
    ```

2. Make the script executable

    ```sh
    chmod +x fuzzpass.sh
    ```

3. Put it somewhere on your path
    ```sh
    cp fuzzpass.sh /usr/local/bin/fuzzpass
    ```
    The filename should be the command you would like to invoke the tool with

## Usage

1. Ensure you are logged into lastpass-cli with `lpass status` and `lpass login`

2. Run the name of the executable

  ```
  Usage: ./fuzzpass.sh [OPTIONS]

  If no options are provided, the password of the selected entry will be copied to clipboard

  Options:
    -s, --show        Show the full entry
    -u, --username    Copy the username to clipboard
    -e, --edit        Edit the entry
    -r, --remove      Remove the entry
    -h, --help        Show this help message
  ```

# Introduction

> "kei, u should upload ur dotfiles"

> "why ur github is full of private commits"

> "haha loonix goes brrrr"

# Init-playbooks

These are the playbooks for bootstrapping my workstations and machines. Typically I
install `git` and `ansible` on the new host, `git clone` this repository and
then run [local.sh](local.sh) to run the playbook on the current machine.

`local.sh` sets variables depending on the hostname, so certain tasks/templates
are executed differently based on whether the machine is a workstation (with a
physical keyboard) or a server. The list of workstation hosts is maintained in
[inventory.yaml](inventory.yaml) and [workstations](workstations).


### Roles

In order:

##### `packages`

Installs many packages on the machine, requires root for obvious reasons.
Supports `archlinux`, `debian` and `void`. The package list is maintained in
[roles/packages/defaults/main.yaml](roles/packages/defaults/main.yaml).

On `archlinux` and `void` this installs programming languages and tools, whereas
on `debian` this mainly installs helpers and compilers.

##### `dotfiles`

Installs most of my dotfiles.

##### `zsh`

Installs my ZSH dotfiles, [antibody](https://github.com/getantibody/antibody)
and my ZSH plugins. Requires root to install `antibody`.

##### `gpg`

Installs my GPG public key and grants it ultimate trust.

##### `neovim`

Installs my neovim dotfiles, [dein](https://github.com/Shougo/dein.vim) and my
neovim plugins.

### License

This repository is in the [public domain](LICENSE.md).

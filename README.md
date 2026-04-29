# Dotfiles Core

This repository contains the ansible roles to setup my core programs and dotfiles.
This repository does NOT contain any ansible playbooks - it is meant to be used as
a submodule for other repositories.

The `common` role MUST be executed first in playbooks - all other roles depend on `common`.

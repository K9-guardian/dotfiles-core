#!/bin/sh
ANSIBLE_VENV="$HOME/.local/ansible-venv"
python3 -m venv "$ANSIBLE_VENV"
"$ANSIBLE_VENV/bin/pip" install ansible==13.6.0

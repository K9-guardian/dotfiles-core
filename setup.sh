#!/bin/sh
curl -LsSf https://astral.sh/uv/install.sh | sh

ANSIBLE_VENV="$HOME/.local/ansible-venv"
uv venv --python 3.14.4 "$ANSIBLE_VENV"
uv pip install ansible==13.6.0 --python "$ANSIBLE_VENV/bin/python"

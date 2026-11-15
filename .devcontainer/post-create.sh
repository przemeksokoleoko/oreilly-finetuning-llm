#!/usr/bin/env bash
set -euo pipefail

workspace_dir="$(pwd)"
sudo chown -R "$(id -u):$(id -g)" "$workspace_dir"

sudo apt-get update
sudo apt-get install -y --no-install-recommends ca-certificates curl

curl -LsSf https://astral.sh/uv/install.sh -o /tmp/uv-install.sh
sudo env UV_INSTALL_DIR=/usr/local/bin sh /tmp/uv-install.sh

uv python install 3.14
uv sync --python 3.14

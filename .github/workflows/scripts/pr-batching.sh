#!/bin/bash

# A script to help with adding the necessary workflow files to enable "PR batching" for dependency updates on your
# project(s). Intended to work with nori https://github.com/Financial-Times/nori or similar tools

mkdir -p .github/workflows

cat << EOF > .github/workflows/dep-updates_tracking-branch.yml
name: Maintain dependency update batching branch

on:
  push:
    branches:
      - main

jobs:
  update-dependency-update-branch:
    permissions:
      id-token: write
      contents: write
    name: Keep tracking branch up to date with main
    uses: guardian/.github/.github/workflows/pr-batching_tracking-branch.yml@v1.0.1
EOF

cat << EOF > .github/workflows/dep-updates_set-automerge.yml
name: Set automerge on dependency update PRs

on:
  pull_request:
    branches:
      - dependency-updates

jobs:
  set-automerge:
    name: Set automerge on opened PRs targeting the tracking branch
    permissions:
      contents: write
      pull-requests: write
    uses: guardian/.github/.github/workflows/pr-batching_set-automerge.yml@v1.0.1
EOF

cat << EOF > .github/workflows/dep-updates_pr-tracking-branch-to-default.yml
name: Create batch dependency update PR

on:
  schedule:
    - cron: "35 10 1 * *"
  # Provide support for manually triggering the workflow via GitHub.
  workflow_dispatch:

jobs:
  pr-tracking-branch:
    name: Open a PR from dependency-updates targeting main
    uses: guardian/.github/.github/workflows/pr-batching_pr-tracking-branch-to-default.yml@v1.0.1
EOF

git add .github/workflows/dep-updates_*.yml
git commit -m 'chore: Add dependency update workflows'

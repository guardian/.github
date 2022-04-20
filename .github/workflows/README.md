# Snyk

We have two Snyk actions. [sbt-node-snyk](sbt-node-snyk.yml) and [sbt-node-snyk-pr](sbt-node-snyk-pr.yml).

It is recommended you use both on your project for greater coverage.

## Requirements

1. `SNYK_TOKEN` must be available in your repo's 'Actions secrets' under 'Organization secrets' (Go to `/settings/secrets/actions`). If you cannot see this, ask an engineering manager to add it to your repo.
1. `with: ORG:` be sure to edit this in the `yml` examples below. This will be the org within Snyk
![image](https://user-images.githubusercontent.com/48949546/112194614-f6985880-8c00-11eb-946f-a88fdae57662.jpg)

A convention we have is to have these files called `.github/workflows/snyk.yml` and `.github/workflows/snyk-pr.yml`.

# [`snyk monitor`](https://docs.snyk.io/snyk-cli/commands/monitor)

This action creates a project in your Snyk account to monitor open source SBT and Node vulnerabilities and license issues on a cron job.

## Usage

See [sbt-node-snyk.yml](sbt-node-snyk.yml)

### Basic usage

```yml
name: Snyk

on:
  schedule:
    - cron: '0 6 * * *'
  push:
    branches:
      - main
  pull_request:
  workflow_dispatch:

jobs:
  security:
    uses: guardian/.github/.github/workflows/sbt-node-snyk.yml@main
    with:
      ORG: ~
    secrets:
       SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

`ORG` is required and should be your organisation name in Snyk. If this organisation doesn't exist, it will be created.

This will scan both SBT and Node vulnerabilities.

### Advanced usage

#### Skip Node

```yml
name: Snyk
# ...
on:
  schedule:
    - cron: '0 6 * * *'
  push:
    branches:
      - main
  pull_request:
  workflow_dispatch:

jobs:
  security:
    uses: guardian/.github/.github/workflows/sbt-node-snyk.yml@main
    with:
      ORG: ~
      SKIP_NODE: true
    secrets:
       SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

#### Skip SBT

```yml
name: Snyk
# ...
on:
  schedule:
    - cron: '0 6 * * *'
  push:
    branches:
      - main
  pull_request:
  workflow_dispatch:

jobs:
  security:
    uses: guardian/.github/.github/workflows/sbt-node-snyk.yml@main
    with:
      ORG: ~
      SKIP_SBT: true
    secrets:
       SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

More options can be found in [the inputs of the action](sbt-node-snyk.yml#L5).

# [`snyk test`](https://docs.snyk.io/snyk-cli/commands/test)

This action checks projects for open source SBT and Node vulnerabilities and license issues.

This should be run `on: pull_request`. `on: pull_request: paths` is optional but is recommendedto reduce the risk of producing unhelpful results.

## Usage

See [sbt-node-snyk-pr.yml](sbt-node-snyk-pr.yml)

### Basic usage

```yml
name: Snyk

on:
  pull_request:
    paths:
      - 'build.sbt'
      - 'package.json'

jobs:
  security:
    uses: guardian/.github/.github/workflows/sbt-node-snyk-pr.yml@main
    with:
      ORG: ~
      SEVERITY_THRESHOLD: critical
    secrets:
       SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

`ORG` is required and should be your organisation name in Snyk. If this organisation doesn't exist, it will be created.

More options can be found in [the inputs of the action](sbt-node-snyk-pr.yml#L5).
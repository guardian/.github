# Reusable Workflows
This directory contains [reusable workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows) for the `guardian` GitHub organisation. 
Instructions for using each of them can be found in the [docs](./docs) folder.

_N.B. Reusable workflows must be defined at the top level of the `.github/workflows` directory, so related workflows
are recommended to be namespaced using prefixes rather than subdirectories._

## Releasing workflows
These workflows are versioned.

Releases are automatically created when changes to workflows or workflow-templates are merged to `main`.

Release notes are added automatically.

### How versioning works

The [release.yaml](release.yaml) workflow uses [semantic versioning](https://semver.org/) based on commit message prefixes:

- **Major version bump** (e.g., `v1.0.0` → `v2.0.0`): Use `breaking:` or `major:` prefix
  ```
  breaking: remove deprecated snyk workflows
  ```

- **Minor version bump** (e.g., `v1.0.0` → `v1.1.0`): Use `feat:`, `feature:`, or `minor:` prefix
  ```
  feat: add new deployment workflow
  ```

- **Patch version bump** (e.g., `v1.0.0` → `v1.0.1`): All other commit messages
  ```
  fix: correct require-label workflow permissions
  ```
The new version of the workflows will be made available to calling code by Dependabot or calling code can just be updated manually.

> [!Note]
> When a release is made, **all** workflows will have a new version released.    
> So it may well be that different versions of a particular workflow are actually identical.

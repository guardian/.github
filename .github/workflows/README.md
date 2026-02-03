# Reusable Workflows
This directory contains [reusable workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows) for the `guardian` GitHub organisation. 
Instructions for using each of them can be found in the [docs](./docs) folder.

_N.B. Reusable workflows must be defined at the top level of the `.github/workflows` directory, so related workflows
are recommended to be namespaced using prefixes rather than subdirectories._

### Releasing workflows
These workflows are versioned.
To build a new release:
1. Go to the [releases](https://github.com/guardian/.github/releases) page.
2. Draft a new release.
3. Give the new release a version number following [semantic versioning](https://semver.org/) guidelines.
4. Generate release notes.

The new version of the workflows will be made available to calling code by Dependabot or calling code can just be updated manually.

> [!Note]
> When a release is made, **all** workflows will have a new version released.    
> So it may well be that different versions of a particular workflow are actually identical.

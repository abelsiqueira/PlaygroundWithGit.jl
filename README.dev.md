# Developer documentation

- Fork this repository.
- Clone your fork.
- Add this repo as upstream with

```bash
git remote add upstream https://github.com/abelsiqueira/PlaygroundWithGit.jl
```

- Open this project in your editor, activate and instantiate the project.
- Run the tests to make sure that everything is working as expected.

## Linting and formatting

We use [https://pre-commit.com](https://pre-commit.com) to run the linter and formatter of many things.
In particular, the Julia code is formatted using [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl).

You can install `pre-commit` globally using `pip install --user pre-commit`.
If you prefer to create a local environment with it, do the following:

```bash
python -m venv env
. env/bin/activate
pip install --upgrade pip setuptools pre-commit
```

With `pre-commit` installed, activate it as a pre-commit hook:

```bash
pre-commit install
```

To run the linting and formatting manually, enter the command below:

```bash
pre-commit run -a
```

Do it once now to make sure that everything works as expected.

Now, you can only commit if all the pre-commit tests pass.

## Contributing workflow

- Always branch from `main`

- Add a branch prefix

  - If there is an associated issue, add the issue number
  - If there is no associated issue, **and the changes are small**, add a prefix such as "typo", "hotfix", "small-refactor", according to the type of update.
  - If the changes are not small and there is no associated issue, then create the issue first, so we can properly discuss the changes
- Commit message

  - Use imperative, present tense (Add feature, Fix bug)
  - Have informative titles
  - If necessary, add a body with details
- Try to create "atomic git commits" (self-promotion: [The Utopic Git History](https://blog.esciencecenter.nl/the-utopic-git-history-d44b81c09593))
- Make sure the tests pass
- Make sure the pre-commit tests pass
- Before creating the pull-request, fetch any `main` updates from upstream and rebase your branch into `origin/main` if necessary
- Open a pull request and work with the reviewer to address any issues

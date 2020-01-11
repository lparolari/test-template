# Test Template

[![Build Status](https://travis-ci.com/lparolari/test-template.svg?branch=master)](https://travis-ci.com/lparolari/test-template)

> A handy latex template for tests in high school.

## Installation

```
git clone git@github.com:lparolari/test-template.git test-name
cd test-name
rm -rf .git
```

## Usage

- **Edit** `test.tex`.
- **Run** `make pdf`.

### FYI

The directory is composed by a bunch of source files.

- `test.tex`, the main file where. Here you can write the exercise text.
- `examconfig.tex` contains the configurations for the main file: here you can tweak some configurations to meet your requirements. Basically it is needed for _on-the-fly_ macros and utilities.
- `packages.tex` contains all packages needed by the main file.
- `macros.tex` where you can find some useful commands and macros (more information [here](https://github.com/lparolari/latex-macros)).
- `prooftree.tex`, a handy packages for creating prooftrees (needed by `macros.txt`).

## Example

You can see how the template looks like in releases: see the last release [here](https://github.com/lparolari/test-template/releases).

## Author

Luca Parolari <<luca.parolari23@gmail.com>>

## License

See [LICENSE](LICENSE) file.

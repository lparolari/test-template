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

### Edit

With texstudio

```
texstudio test.tex
```

or with Visual Studio Code

```
code test.tex
```

### Run

Build latex sources to pdf with

```
make pdf
```

Copy pdf to destination folders:

- copy to **solution** folder with `make solution`
- copy to **final** folder with `make final`

### Directory Structure

The directory is composed by a bunch of source files and some folders.

- `test.tex`, the main file. Here you can write your test. You should edit only this file.
- `examconfig.tex` contains the configurations for the main file: here you can tweak some configurations to meet your requirements. Basically it is needed for _on-the-fly_ macros and utilities.
- `config.tex` contains some useful macros and configurations for this particular task.
- `packages.tex` contains all packages needed by the main file.
- `macros.tex` where you can find some useful commands and macros (more information [here](https://github.com/lparolari/latex-macros)).
- `prooftree.tex`, a handy packages for creating prooftrees (needed by `macros.txt`).

- `solution`, a directory where you can store the final version of the main file. This directory contains a `.gitignore` that allows pdf to be under source control, i.e. you can include pdf in source control with an edit.
- `final`, a directory where you can store the final version of the main file, obviuously without solutions. This directory is useful is you want to save some pdf files as the final versions, i.e. when you give the test to the class.

## Example

You can see how the template looks like in releases: see the last release [here](https://github.com/lparolari/test-template/releases), or

- see the [solution](solution/test.pdf) pdf,
- see the [final](final/test.pdf) pdf.

## Author

Luca Parolari <<luca.parolari23@gmail.com>>

## License

See [LICENSE](LICENSE) file.

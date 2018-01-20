# TypeScript in Go

Example of embedding TypeScript in a Go executable.

## Build-time requirements

* A recent version of the `go` compiler.
* `make`
* A `tsc` command, for compiling TypeScript to JavaScript
* `go-bindata`, install with: `go get -u github.com/jteeuwen/go-bindata/...`

## Run-time requirements

* None, only the built executable (that embeds TypeScript)

## Example

1. Edit `src/main.ts`
2. Build the project with `make`
3. Run `./main` and see the output generated from the embedded TypeScript file

## Quick start with Docker

There is a docker image included in the `docker` folder, with all required dependencies installed.

Just build and run:

    cd docker; ./build.sh; ./compile.sh; ./main

Then edit `docker/src/main.ts` and run `./compile.sh; ./main` again.

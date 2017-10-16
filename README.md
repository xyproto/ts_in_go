# TypeScript in Go

Example of embedding TypeScript in Go.

## Requirements

* A recent version of the `go` compiler.
* `make`
* `tsc` command, for compiling TypeScript to JavaScript
* `go-bindata`, install with: `go get -u github.com/jteeuwen/go-bindata/...`

## Example

1. Edit `src/hello.ts`
2. Build the project with `make`
3. Run `./main` and see the output generated from the embedded TypeScript file

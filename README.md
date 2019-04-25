# TypeScript in Go

Example of embedding TypeScript in a Go executable.

## Work in progress

```
../node_modules/@types/react/index.d.ts:169:11 - error TS2559: Type 'Component<P, S>' has no properties in common with type 'ComponentLifecycle<P, S>'.
169     class Component<P, S> implements ComponentLifecycle<P, S> {
~~~~~~~~~
```

There is currently an error when compiling "hello world". To be figured out. This repository is a work in progress!

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

package main

import (
	"github.com/robertkrimen/otto"
)

func main() {
	vm := otto.New()
	vm.Run(string(MustAsset("hello.js")))
}

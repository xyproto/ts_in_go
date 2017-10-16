.PHONY: all clean

SOURCE_DIR=src
GENERATED_JS_DIR=gen

all: main

${GENERATED_JS_DIR}/hello.js: ${SOURCE_DIR}/hello.ts
	tsc -p ${SOURCE_DIR} --strict --sourceMap --removeComments --outDir ${GENERATED_JS_DIR}

${SOURCE_DIR}/data.go: ${GENERATED_JS_DIR}/hello.js
	go-bindata --prefix ${GENERATED_JS_DIR} -o ${SOURCE_DIR}/data.go ${GENERATED_JS_DIR}

main: ${SOURCE_DIR}/main.go ${SOURCE_DIR}/data.go
	cd ${SOURCE_DIR} && go build -o ../main
	
clean:
	rm -rf main ${SOURCE_DIR}/data.go ${GENERATED_JS_DIR} *.bak *~ *.tmp *.swp


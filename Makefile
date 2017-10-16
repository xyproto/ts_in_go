.PHONY: all clean

GO_DIR ?= ./go
TS_DIR ?= ./ts
BIN_DIR ?= ./bin
JS_DIR ?= ./js
DATA_DIR ?= ./data
EXECUTABLE ?= main
DATA_FILENAME ?= data.go

all: ${BIN_DIR}/${EXECUTABLE}

${JS_DIR}: ${TS_DIR}
	@echo "Generating ${TS_DIR}/tsconfig.json"
	@cd "${TS_DIR}" && tsc --init *.ts >/dev/null
	@mkdir -p "${JS_DIR}"
	@echo "Compiling TypeScript in ${TS_DIR} to JavaScript in ${JS_DIR}"
	@tsc -p "${TS_DIR}" --removeComments --outDir "${JS_DIR}"

${GO_DIR}/data.go: ${JS_DIR}
	@echo "Embedding JavaScript from ${JS_DIR} in ${GO_DIR}/${DATA_FILENAME}"
	@go-bindata --prefix "${JS_DIR}" -o "${GO_DIR}/${DATA_FILENAME}" "${JS_DIR}" "${DATA}"

${BIN_DIR}/${EXECUTABLE}: ${GO_DIR}/main.go ${GO_DIR}/${DATA_FILENAME}
	@echo "Compiling Go from ${GO_DIR} to ${BIN_DIR}/${EXECUTABLE}"
	@cd "${GO_DIR}" && go build -i -o "${EXECUTABLE}"
	@mkdir -p "${BIN_DIR}"
	@mv "${GO_DIR}/${EXECUTABLE}" "${BIN_DIR}/${EXECUTABLE}"
	@echo Done
	
clean:
	@rm -f *.bak *~ *.tmp *.swp
	@rm -rf "${JS_DIR}"
	@rm -f "${GO_DIR}/${DATA_FILENAME}" "${BIN_DIR}/${EXECUTABLE}" "${TS_DIR}/tsconfig.json"
	@rmdir --ignore-fail-on-non-empty "${BIN_DIR}"

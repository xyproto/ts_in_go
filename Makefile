.PHONY: all clean

GO_DIR ?= ./go
TS_DIR ?= ./src
JS_DIR ?= ./js
DATA_DIR ?=
EXECUTABLE ?= main
DATA_FILENAME ?= data.go

all: ${EXECUTABLE} clean_tempfiles

${TS_DIR}/tsconfig.json: ${TS_DIR}
	@echo "Generating ${TS_DIR}/tsconfig.json"
	@cd "${TS_DIR}" && /usr/bin/tsc --init *.ts >/dev/null
	@sed 's/\"strict\": true/\"strict\": false/g' -i "${TS_DIR}/tsconfig.json"

${JS_DIR}: ${TS_DIR}/tsconfig.json
	@echo "Compiling TypeScript in ${TS_DIR} to JavaScript in ${JS_DIR}"
	@mkdir -p "${JS_DIR}" && /usr/bin/tsc -p "${TS_DIR}" --removeComments --outDir "${JS_DIR}"

${GO_DIR}/data.go: ${JS_DIR}
	@echo "Embedding JavaScript from ${JS_DIR} in ${GO_DIR}/${DATA_FILENAME}"
	@go-bindata --pkg main --prefix "${JS_DIR}" -o "${GO_DIR}/${DATA_FILENAME}" "${JS_DIR}" "${DATA_DIR}"

${EXECUTABLE}: ${GO_DIR}/main.go ${GO_DIR}/${DATA_FILENAME}
	@echo "Compiling Go from ${GO_DIR} to ${EXECUTABLE}"
	@cd "${GO_DIR}" && go build -o "${EXECUTABLE}"
	@mv "${GO_DIR}/${EXECUTABLE}" "${EXECUTABLE}"
	@echo Done

distclean: clean
	@rm -rf "${JS_DIR}"
	@rm -f "${GO_DIR}/${DATA_FILENAME}" "${TS_DIR}/tsconfig.json"

clean:
	@rm -f *.bak *~ *.tmp *.swp
	@rm -f "${EXECUTABLE}"

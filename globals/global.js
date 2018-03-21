var fs = require('fs'), path = require('path')
var wasm = fs.readFileSync(path.join(__dirname, './global.wasm'))

var m = WebAssembly.Module(wasm)
var instance = WebAssembly.Instance(m)

console.log(WebAssembly.Module.imports(m))
console.log(WebAssembly.Module.exports(m))
console.log(new Buffer(instance.exports.memory.buffer).slice(0, 1024))



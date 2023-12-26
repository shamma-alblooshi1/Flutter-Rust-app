import init, { encrypt as wasmEncrypt, decrypt as wasmDecrypt } from './pkg/cryptor.js';

async function loadWasm() {
    await init();
    window.encrypt = function(data, key, iv) {
        return wasmEncrypt(data, key, iv);
    };
    window.decrypt = function(data, key, iv) {
        return wasmDecrypt(data, key, iv);
    };
}

loadWasm().then(() => {
    console.log('WebAssembly module loaded, and `encrypt` and `decrypt` are attached to window');
});

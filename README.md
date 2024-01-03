# Flutter-Rust-app

## Requirements 
Android [SDK](https://developer.android.com/studio)

Android [NDK](https://developer.android.com/ndk/) installed

ANDROID_HOME env variable pointing to the Android SDK location

Android NDK version should match the one inside the rust-library/cryptor_jni/build.rs file

Install [Rust](https://www.rust-lang.org/tools/install)

## Usage 
### Creating the JNI files for Android 
```bash
cd rust-library/cryptor_jni
cargo run --bin release
cargo run --bin publish
```
### Creating the wasm package for Web apps
```bash
cd rust-library/cryptor_wasm
rustup target add wasm32-unknown-unknown
cargo build --target wasm32-unknown-unknown
wasm-pack build --target web 
```

## Running the Flutter application
Import in Android Studio the app folder

Run app via IDE selected 

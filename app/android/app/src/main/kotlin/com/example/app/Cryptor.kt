package com.example.app

class Cryptor {
    companion object {
        init {
            System.loadLibrary("cryptor_jni")
        }

        external fun encrypt(input: String, key: String, iv: String): String
        external fun decrypt(input: String, key: String, iv: String): String
    }
}

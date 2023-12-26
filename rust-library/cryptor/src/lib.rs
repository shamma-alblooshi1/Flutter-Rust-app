use aes_gcm::{Aes256Gcm, aead::{Aead, NewAead}};
use aes_gcm::aead::generic_array::GenericArray;
use hex_literal::hex;

// Constants for the key and IV (nonce in GCM)
//const KEY: &[u8; 32] = &hex!("f5c4ac76feb1460409d4b35affdba3132d0a229f26e2a0c1b571f03e428c8bbe"); //hexadecimal to byte
//const IV: &[u8; 12] = &hex!("3fbe591cb9c8055c72560679"); //12 byte nonce for gcm
/// Encrypts a string using AES256 in GCM mode.


fn hex_string_to_byte_array(hex_string: &str) -> Result<Vec<u8>, hex::FromHexError> {
    hex::decode(hex_string)
}


pub fn encrypt(to_encrypt: &str,  key_hex: &str, iv_hex: &str) -> String {

    let key_bytes = hex_string_to_byte_array(key_hex).expect("Invalid key format");
    let iv_bytes = hex_string_to_byte_array(iv_hex).expect("Invalid IV format");

    let key = GenericArray::from_slice(&key_bytes);
    let cipher = Aes256Gcm::new(key);
    let nonce = GenericArray::from_slice(&iv_bytes);

    let ciphertext = cipher.encrypt(nonce, to_encrypt.as_bytes().as_ref())
        .expect("encryption failure!");
    hex::encode(ciphertext)
}

/// Decrypts a string using AES256 in GCM mode.

pub fn decrypt(to_decrypt: &str, key_hex: &str, iv_hex: &str) -> String {
    let key_bytes = hex_string_to_byte_array(key_hex).expect("Invalid key format");
    let iv_bytes = hex_string_to_byte_array(iv_hex).expect("Invalid IV format");

    let key = GenericArray::from_slice(&key_bytes);
    let cipher = Aes256Gcm::new(key);
    let nonce = GenericArray::from_slice(&iv_bytes);

    let decrypted_data = cipher.decrypt(nonce, hex::decode(to_decrypt).unwrap().as_ref())
        .expect("decryption failure!");
    String::from_utf8(decrypted_data).unwrap()
}




#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "aegis128l_aesni.h"
#import "aegis128l_armcrypto.h"
#import "aegis128l_common.h"
#import "aegis128l_soft.h"
#import "implementations.h"
#import "aegis256_aesni.h"
#import "aegis256_armcrypto.h"
#import "aegis256_common.h"
#import "aegis256_soft.h"
#import "implementations.h"
#import "base.h"
#import "base2.h"
#import "constants.h"
#import "fe.h"
#import "base.h"
#import "base2.h"
#import "constants.h"
#import "fe.h"
#import "blake2.h"
#import "blake2b-compress-avx2.h"
#import "blake2b-compress-sse41.h"
#import "blake2b-compress-ssse3.h"
#import "blake2b-load-avx2.h"
#import "blake2b-load-sse2.h"
#import "blake2b-load-sse41.h"
#import "poly1305_donna.h"
#import "poly1305_donna32.h"
#import "poly1305_donna64.h"
#import "onetimeauth_poly1305.h"
#import "poly1305_sse2.h"
#import "argon2-core.h"
#import "argon2-encoding.h"
#import "argon2.h"
#import "blake2b-long.h"
#import "blamka-round-avx2.h"
#import "blamka-round-avx512f.h"
#import "blamka-round-ref.h"
#import "blamka-round-ssse3.h"
#import "crypto_scrypt.h"
#import "pbkdf2-sha256.h"
#import "x25519_ref10.h"
#import "consts_namespace.h"
#import "curve25519_sandy2x.h"
#import "fe.h"
#import "fe51.h"
#import "fe51_namespace.h"
#import "ladder.h"
#import "ladder_namespace.h"
#import "scalarmult_curve25519.h"
#import "shorthash_siphash_ref.h"
#import "sign_ed25519_ref10.h"
#import "chacha20_dolbeau-avx2.h"
#import "chacha20_dolbeau-ssse3.h"
#import "u0.h"
#import "u1.h"
#import "u4.h"
#import "u8.h"
#import "chacha20_ref.h"
#import "stream_chacha20.h"
#import "salsa20_ref.h"
#import "stream_salsa20.h"
#import "salsa20_xmm6.h"
#import "salsa20_xmm6int-avx2.h"
#import "salsa20_xmm6int-sse2.h"
#import "u0.h"
#import "u1.h"
#import "u4.h"
#import "u8.h"
#import "sodium.h"
#import "core.h"
#import "crypto_aead_aegis128l.h"
#import "crypto_aead_aegis256.h"
#import "crypto_aead_aes256gcm.h"
#import "crypto_aead_chacha20poly1305.h"
#import "crypto_aead_xchacha20poly1305.h"
#import "crypto_auth.h"
#import "crypto_auth_hmacsha256.h"
#import "crypto_auth_hmacsha512.h"
#import "crypto_auth_hmacsha512256.h"
#import "crypto_box.h"
#import "crypto_box_curve25519xchacha20poly1305.h"
#import "crypto_box_curve25519xsalsa20poly1305.h"
#import "crypto_core_ed25519.h"
#import "crypto_core_hchacha20.h"
#import "crypto_core_hsalsa20.h"
#import "crypto_core_ristretto255.h"
#import "crypto_core_salsa20.h"
#import "crypto_core_salsa2012.h"
#import "crypto_core_salsa208.h"
#import "crypto_generichash.h"
#import "crypto_generichash_blake2b.h"
#import "crypto_hash.h"
#import "crypto_hash_sha256.h"
#import "crypto_hash_sha512.h"
#import "crypto_kdf.h"
#import "crypto_kdf_blake2b.h"
#import "crypto_kdf_hkdf_sha256.h"
#import "crypto_kdf_hkdf_sha512.h"
#import "crypto_kx.h"
#import "crypto_onetimeauth.h"
#import "crypto_onetimeauth_poly1305.h"
#import "crypto_pwhash.h"
#import "crypto_pwhash_argon2i.h"
#import "crypto_pwhash_argon2id.h"
#import "crypto_pwhash_scryptsalsa208sha256.h"
#import "crypto_scalarmult.h"
#import "crypto_scalarmult_curve25519.h"
#import "crypto_scalarmult_ed25519.h"
#import "crypto_scalarmult_ristretto255.h"
#import "crypto_secretbox.h"
#import "crypto_secretbox_xchacha20poly1305.h"
#import "crypto_secretbox_xsalsa20poly1305.h"
#import "crypto_secretstream_xchacha20poly1305.h"
#import "crypto_shorthash.h"
#import "crypto_shorthash_siphash24.h"
#import "crypto_sign.h"
#import "crypto_sign_ed25519.h"
#import "crypto_sign_edwards25519sha512batch.h"
#import "crypto_stream.h"
#import "crypto_stream_chacha20.h"
#import "crypto_stream_salsa20.h"
#import "crypto_stream_salsa2012.h"
#import "crypto_stream_salsa208.h"
#import "crypto_stream_xchacha20.h"
#import "crypto_stream_xsalsa20.h"
#import "crypto_verify_16.h"
#import "crypto_verify_32.h"
#import "crypto_verify_64.h"
#import "export.h"
#import "asm_cet.h"
#import "chacha20_ietf_ext.h"
#import "common.h"
#import "ed25519_ref10.h"
#import "ed25519_ref10_fe_25_5.h"
#import "ed25519_ref10_fe_51.h"
#import "implementations.h"
#import "mutex.h"
#import "softaes.h"
#import "sse2_64_32.h"
#import "randombytes.h"
#import "randombytes_internal_random.h"
#import "randombytes_sysrandom.h"
#import "runtime.h"
#import "utils.h"

FOUNDATION_EXPORT double libsodiumVersionNumber;
FOUNDATION_EXPORT const unsigned char libsodiumVersionString[];


# Imports
import argparse
import os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives.serialization import load_pem_public_key, load_pem_private_key

# Constants
MODE_CBC = b'i\x1e\x08\x9bR9%\x93\xacH\x94Xk\x02\x13\xd0'
SALT = b'\xe7t\x83=~\xd3\x87;\xeb\xf33OdZ\x05E'


# Functions
def generate_aes_key(
    password: bytes, 
    length: int, 
    iterations: int = 39000,
) -> bytes:
    kdf_kwargs = dict(
        algorithm=hashes.SHA256(),
        length=length, 
        salt=SALT, 
        iterations=iterations)
    kdf = PBKDF2HMAC(**kdf_kwargs)
    key = kdf.derive(password)
    kdf = PBKDF2HMAC(**kdf_kwargs)
    kdf.verify(password, key)
    return key

def generate_rsa_keys(save_name: str, passwd: str) -> None:
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048)
    pem = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=\
            serialization.BestAvailableEncryption(str.encode(passwd)))
    with open(save_name + '_private.key', 'wb') as file:
        file.write(pem)
    public_key = private_key.public_key()
    pem = public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo)
    with open(save_name + '_public.key', 'wb') as file:
        file.write(pem)


def add_padding(msg: bytes, m: int) -> bytes:
    pad_length = (m - len(msg) % m) if (len(msg) % m) else 0
    padding = b'\x00' * pad_length \
            + b'\x01' * (m - pad_length) \
            + b'\x00' * pad_length
    return msg + padding

def remove_padding(msg: bytes, m: int) -> bytes:
    pad_length = m - sum(msg[-m:])
    return msg[:-m-pad_length]


def aes_encrypt(
    msg: bytes, 
    passwd: str,
) -> bytes:
    key = generate_aes_key(str.encode(passwd), 32)
    cipher = Cipher(
        algorithms.AES(key), 
        modes.CBC(MODE_CBC))
    encryptor = cipher.encryptor()
    msg = add_padding(msg, 16)
    return encryptor.update(msg) + encryptor.finalize()

def aes_decrypt(msg: bytes, passwd: str) -> bytes:
    key = generate_aes_key(str.encode(passwd), 32)
    cipher = Cipher(
        algorithms.AES(key), 
        modes.CBC(MODE_CBC))
    decryptor = cipher.decryptor()
    msg = decryptor.update(msg) + decryptor.finalize()
    return remove_padding(msg, 16)


def rsa_encode(
    src_path: str, 
    key_path: str, 
    dst_path: str,
) -> None:
    # Load the message's bytes
    with open(src_path, 'r') as file:
        msg = add_padding(
            str.encode(file.read()), 
            190)
    # Load the public key
    with open(key_path, 'rb') as file:
        public_key = load_pem_public_key(file.read())
    # Encrypt the message
    buffer = b''
    while msg:
        buffer += public_key.encrypt(
            msg[:190],
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None))
        msg = msg[190:]
    # Save the encrypted message
    with open(dst_path, 'wb') as file:
        file.write(buffer)

def rsa_decode(
    src_path: str,
    key_path: str,
    dst_path: str,
    passwd: str,
) -> None:
    # Load the private key
    with open(key_path, 'rb') as file:
        private_key = load_pem_private_key(
            file.read(),
            str.encode(passwd))
    # Load the encrypted bytes
    with open(src_path, 'rb') as file:
        message = file.read()
    # Decrypt the message
    buffer = b''
    while message:
        buffer += private_key.decrypt(
            message[:256],
            padding.OAEP(
                mgf=padding.MGF1(algorithm=hashes.SHA256()),
                algorithm=hashes.SHA256(),
                label=None
            )
        )
        message = message[256:]
    # Save the decrpyted message
    buffer = remove_padding(buffer, 190)
    with open(dst_path, 'w') as file:
        x = buffer.decode('utf-8')
        file.write(x)


# Script
if __name__ == '__main__':
    # Parsing
    parser = argparse.ArgumentParser(description='Get argument for AES encryption.')
    parser.add_argument('-es', action='store_true')
    parser.add_argument('-ea', action='store_true')
    parser.add_argument('-ds', action='store_true')
    parser.add_argument('-da', action='store_true')
    parser.add_argument('-g', action='store_true')
    parser.add_argument('-src')
    parser.add_argument('-o')
    parser.add_argument('-a')
    parser.add_argument('--passwd', default='secret')
    args = parser.parse_args()
    print(args)


    # Args check
    if args.src is None and (args.es or args.ds or args.ea or args.da):
        raise ValueError('Please choose a source file')

    if sum((args.es, args.ds, args.g, args.ea, args.da)) != 1:
        raise ValueError('Choose one and only one mode in -es; -ds; -g; -ea; da')

    if args.o is None:
        if args.es or args.ds or args.ea:
            if    args.es: ext = 'sym'
            elif  args.ea: ext = 'asy'
            else:          ext = 'txt'
            args.o = args.src[:-3] + ext
            if os.path.isfile(args.o):
                raise ValueError(f"Choose an out file as {args.o} already exists.")
            else:
                print(f"Using fallback out file {args.o}")
        else:
            raise ValueError('Choose an out file.')


    # Actions
    if args.es:
        with open(args.src, 'r') as file:
            lines = file.readlines()
        buffer = ''.join(lines)
        msg = str.encode(buffer)
        msg = aes_encrypt(msg, args.passwd)
        with open(args.o, 'wb') as file:
                file.write(msg)

    elif args.ds:
        with open(args.src, 'rb') as file:
            lines = file.readlines()
        buffer = b''.join(lines)
        msg = aes_decrypt(buffer, args.passwd)
        with open(args.o, 'w') as file:
            file.write(msg.decode('utf-8'))

    elif args.g:
        generate_rsa_keys(args.o, args.passwd)

    elif args.ea:
        assert args.a is not None, f"Asymetrical encoding requires a key."
        rsa_encode(args.src, args.a + '_public.key', args.o)

    elif args.da:
        assert args.a is not None, f"Asymetrical decoding requires a key."
        rsa_decode(args.src, args.a + '_private.key', args.o, args.passwd)

    else:
        raise ValueError(f"{args}")
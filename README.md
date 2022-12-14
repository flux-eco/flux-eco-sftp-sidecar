# flux-eco-sidecar-sftp
## Provides
...a docker container with a custom sftp login and password
## Requires
### Environments:
- SFTP_SHARE_LOGIN_FILE
- SFTP_SHARE_PASSWORD_FILE

### Keys
Generate an ed25519 and a rsa key pair on the host system. Mount these key's to /etc/ssh/keys

Naming Conventions
- ssh_host_ed25519_key
- ssh_host_ed25519_key.pub
- ssh_host_rsa_key
- ssh_host_rsa_key.pub


Generating keys example
```
ssh-keygen -t ed25519 -C "example-sftp-share-imports" -f ssh_host_ed25519_key
ssh-keygen -b 4096 -t rsa -C "example-sftp-share-imports" -f ssh_host_rsa_key
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## Authors
Developed and maintained by https://medi.ch

## License

[GNU GPL v3](LICENSE.md)

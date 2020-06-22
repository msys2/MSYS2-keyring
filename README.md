# MSYS2 Keyring

Repository for the MSYS2 keyring package.

## Addition/Removal/Update of a packaging key

1. Add the keyid to `packager-keyids` in alphabetic order, following this
   format: full size keyid, a tab, nickname.

## Revoking a packager key

1. Remove the keyid of the revoked user from `packager-keyids`.
2. Add the removed keyid to `packager-revoked-keyids`, in alphabetic order,
   following this format: full size keyid, a tab, nickname, a tab and reason of
   revocation.

## Keyring release

1. Run update-keys
2. git add the new .asc file in the packager directory.
3. Commit everything as 'Update keyring'
4. Create a new tag ```git tag -s $(date +"%Y%m%d")```
5. Push changes
6. Update the package

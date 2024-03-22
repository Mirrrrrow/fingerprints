# WEAPON FINGERPRINTS
**This resource is currently WIP**

## 📜 Description
This script saves the players fingerprint on a weapon they hold via metadata. The fingerprints can be "washed off" and falsely manipulated. Also you won't put any fingerprints on it if you are wearing gloves.

## 🤖 Exports
Client:
- IsPlayersFingerprintInserted: fun(metadata: table): boolean
- IsPlayersFingerprintOnCurrentWeapon: fun(): booolean

Server:
- AddFingerprint: fun(playerId: number, slot: number, identifier: string)
- RemoveFingerprint: fun(playerId: number, slot: number, identifier: string)
- PurgeFingerprints: fun(playerId: number, slot, number)
- GetFingerprints: fun(playerId: number, slot: number): string[] identifiers

## 📚 Download
As mentioned this resource is currently WIP. For now if you want to contribute you may just download the source code.

## 🎈 Todo
- [x] Fingerprint saving 
- [x] Glove detecting and looping
- [x] "Washing off" fingerprints (basicly use the "PurgeFingerprints" export)
- [x] Manipulating fingerprints
- [ ] Analysing fingerprints (leo f.ex)

## 💡 License
> **This resource is licensed under GNU GPL v3.0**
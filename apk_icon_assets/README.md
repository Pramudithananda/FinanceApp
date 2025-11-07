## APK Launcher Icon Pack

This folder contains density-specific launcher icons derived from the new Niruma Finance artwork. Each sub-directory corresponds to an Android `mipmap-*` density bucket and provides a ready-to-drop `ic_launcher.png`.

```
apk_icon_assets/
├── mipmap-hdpi/ic_launcher.png     (72 × 72)
├── mipmap-mdpi/ic_launcher.png     (48 × 48)
├── mipmap-xhdpi/ic_launcher.png    (96 × 96)
├── mipmap-xxhdpi/ic_launcher.png   (144 × 144)
└── mipmap-xxxhdpi/ic_launcher.png  (192 × 192)
```

### How to apply the icon to `මුදල් කළමනාකරණ_1.0.apk`

1. Decode the APK
   ```bash
   apktool d මුදල් කළමනාකරණ_1.0.apk -o decoded_apk
   ```

2. Replace the existing launcher icons
   ```bash
   cp apk_icon_assets/mipmap-*/ic_launcher.png decoded_apk/res/mipmap-*/
   ```

3. (Optional) Replace adaptive icon XML background/foreground if required.

4. Rebuild and sign
   ```bash
   apktool b decoded_apk -o FinanceApp-icon-refresh.apk
   zipalign -f 4 FinanceApp-icon-refresh.apk FinanceApp-icon-aligned.apk
   apksigner sign --ks my-release-key.jks --out FinanceApp-icon-signed.apk FinanceApp-icon-aligned.apk
   ```

5. Install or distribute `FinanceApp-icon-signed.apk`.

> The same icon artwork is also available at `new_finance_app/assets/icon.png` for other build pipelines.

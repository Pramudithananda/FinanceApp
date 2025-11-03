import com.android.apksig.ApkSigner;
import com.android.apksig.ApkSigner.SignerConfig;

import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SimpleApkSigner {
    private static List<X509Certificate> toX509CertificateList(Certificate[] chain) {
        List<X509Certificate> result = new ArrayList<>();
        if (chain != null) {
            for (Certificate certificate : chain) {
                result.add((X509Certificate) certificate);
            }
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 6) {
            System.err.println("Usage: java SimpleApkSigner <inputApk> <outputApk> <keystore> <keystorePass> <keyAlias> <keyPass>");
            System.exit(1);
        }

        File inputApk = new File(args[0]);
        File outputApk = new File(args[1]);
        String keystorePath = args[2];
        char[] keystorePass = args[3].toCharArray();
        String keyAlias = args[4];
        char[] keyPass = args[5].toCharArray();

        KeyStore keyStore = KeyStore.getInstance("JKS");
        try (FileInputStream fis = new FileInputStream(keystorePath)) {
            keyStore.load(fis, keystorePass);
        }

        PrivateKey privateKey = (PrivateKey) keyStore.getKey(keyAlias, keyPass);
        Certificate[] certChain = keyStore.getCertificateChain(keyAlias);
        List<X509Certificate> certificates = toX509CertificateList(certChain);

        SignerConfig signerConfig = new SignerConfig.Builder("signer", privateKey, certificates)
                .build();

        ApkSigner.Builder builder = new ApkSigner.Builder(Collections.singletonList(signerConfig))
                .setInputApk(inputApk)
                .setOutputApk(outputApk)
                .setV1SigningEnabled(true)
                .setV2SigningEnabled(true)
                .setV3SigningEnabled(true)
                .setV4SigningEnabled(false);

        ApkSigner signer = builder.build();
        signer.sign();
    }
}

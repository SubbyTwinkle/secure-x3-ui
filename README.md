# 3x-ui Securifier

[English](/README.md) | [Русский](/ru_README.md)

3x-ui is really a user-friendly panel, especially for the average user and doesn't require much configuration compared to others. However, this simplicity hides a critical security hole: encryption upon first launch, which is **DOESN'T EXIST**

* **Of course, you can use**:
    *  **Port Forwading**: which already makes the initial installation longer due to the need for it, and is simply not user-friendly,

    *  **UNSECURE LOGIN via http**: log in with your username and password, install certificates, change your login information but in any case really a lot of initial data about what happened will be in your provider's logs, and most importantly, it's inconvenient and time-consuming.

**Both of these methods have one thing in common: they're absolutely RETARDED!**

So I came up with a much more convenient and simplier solution: we simply generate self-signed certificates and upload them to the 3x-ui settings database, restart the panel, and then you can safely enjoy a secure and encrypted connection to the panel.

**And all of that by only one command that do all of this for you!**

* **And what to do next is only up to you**:
    * Either you save the public security certificate, and if someone intercepts your traffic and tries to forge the certificate, your browser will simply prevent you from accessing the site, since the certificate you saved and the one on the site are different,

    * Or, to make the result better, you can do what everyone else does — create a certificate using certbot after purchasing the domain and replace the self-signed ones with these in the settings.

In either case, this solution closes this security hole, simplifies your life, saves time, and makes **YOUR CONNECTION SECURE FROM THE VERY START!**

*Working on 3x-ui v2.8.1 (latest at the moment of creating this script)*

## Install with the latest version

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh) && bash <(curl -Ls https://raw.githubusercontent.com/SubbyTwinkle/secure-x3-ui/securify.sh)
```

## Separate installation, after installing the panel

```bash
bash <(curl -Ls https://raw.githubusercontent.com/SubbyTwinkle/secure-x3-ui/securify.sh)

```





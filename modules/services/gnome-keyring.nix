_: {
  services.gnome.gnome-keyring.enable = true;
  services.passSecretService.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}

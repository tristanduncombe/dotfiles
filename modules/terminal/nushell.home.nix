{
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./starship.home.nix
  ];
  programs = {
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      configFile.source = "${self}/assets/dotfiles/nu/config.nu";
      extraConfig = ''
        use ~/.cache/starship/init.nu
        alias rn = ${pkgs.ranger}/bin/ranger
        cd $env.HOME

        # Wrap ssh so the kitty keyboard protocol is disabled before
        # connecting.  Remote shells (bash) and programs (vim) don't
        # understand the enhanced key sequences, which breaks input.
        def --wrapped ssh [...args: string] {
          # Pop (disable) kitty keyboard enhancement before ssh
          print -n $"(ansi escape)[<u"
          ^ssh ...$args
          # Push (re-enable) kitty protocol when we return
          print -n $"(ansi escape)[>1u"
        }
      '';
    };

    bash = {
      enable = true;
      bashrcExtra = ''
        eval "\$(starship init bash)"
      '';
    };

    zsh = {
      initExtra = ''
        eval "$(starship init zsh)"
      '';
    };

    direnv.enableNushellIntegration = true;

  };
}

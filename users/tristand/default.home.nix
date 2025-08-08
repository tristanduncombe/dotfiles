{
  pkgs,
  self,
  inputs,
  systemSettings,
  ...
}:
{
  imports = [
    "${self}/modules/programs/firefox.home.nix"
    "${self}/modules/programs/fastfetch.home.nix"
    "${self}/modules/programs/vencord.home.nix"
    "${self}/modules/programs/nixcord.home.nix"
    "${self}/modules/terminal/alucard.home.nix"
  ];

  home.packages = with pkgs; [
    # Terminal
    btop # Resource Management
    ranger # File management
    unzip # Unzipper

    # Video/Audio
    feh # Image Viewer
    mpv # Media Player
    obs-studio # Recording
    pavucontrol # Audio Control
    easyeffects
    vlc # Media Player

    # Apps
    appimage-run

    # comma
    comma
    # Dungeondraft/Wonderdraft (requires the .zip from humble bundle in the module directory)
    #(callPackage ../../modules/editors/wonderdraft/wonderdraft.nix {})
    #(callPackage ../../modules/editors/dungeondraft/dungeondraft.nix {})

    # git
    gh
    git-lfs

    jetbrains.rust-rover

    zotero_7

    evince
    xorg.xhost

    materia-kde-theme
    sway-contrib.grimshot
    satty

    libsForQt5.okular

    # image editors
    gimp
    krita

    nordpass

    vscode

    nodejs
  
    dbeaver-bin

    python3Packages.fastapi
    python3Packages.uvicorn
    python3Packages.pydantic
    python3Packages.pandas
    python3Packages.torch
    python3Packages.sklearn
    python3Packages.numpy
    python3Packages.numpy
    python3Packages.sqlite3
    python3Packages.seaborn
    python3


    jetbrains.idea-community

    docker

    # Obsidian!
    obsidian

    # keyring stuff
    # TODO is this necessary?
    gnome-keyring
    # libsecret
    # libgnome-keyring

    # Work Comms
    slack
    zoom-us

    # Office
    onlyoffice-bin

    # texlive
    # xlive.combined.scheme-full

    anki-bin
    nautilus
    usbutils
    xorg.libXxf86vm
    nautilus-open-any-terminal
    libsForQt5.qt5ct
    dnsmasq
    wineWowPackages.stable
    winetricks
    polkit
    radeontop
    thunderbird
  ];
}

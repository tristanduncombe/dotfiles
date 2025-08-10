{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (python-pkgs: [
      python-pkgs.fastapi
      python-pkgs.fastapi-cli
      python-pkgs.uvicorn
      python-pkgs.pydantic
      python-pkgs.pandas
      python-pkgs.torch
      python-pkgs.scikit-learn
      sqlite
      python-pkgs.seaborn
    ]))
  ];
}
{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      moss = {
        hostname = "moss.labs.eait.uq.edu.au";
        user = "s4702098";
      };
      getafix = {
        host = "getafix";
        user = "s4702098";
        hostname = "getafix.smp.uq.edu.au";
        proxyJump = "moss";
      };
      rangpur = {
        host = "rangpur";
        user = "s4702098";
        hostname = "rangpur";
        proxyJump = "moss";
      };
      btq = {
        host     = "btq";
        hostname = "victor-learn.bnr.la";
        user     = "tduncombe";
      };
      # new scorsa
      scorsa = {
        host     = "scorsa";
        hostname = "contour-halt.bnr.la";
        user     = "root";
      };
    };
  };
}

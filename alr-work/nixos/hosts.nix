{ config, pkgs, ... }:

{
  networking.extraHosts =
    ''
	10.80.90.10 kali.nat
	10.99.99.10 kali.ho

	10.80.90.100 entro.nat
	10.99.99.100 entro.ho
    '';

}

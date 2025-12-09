{ inputs, ... }:
{
  sys.secrets = 
  { user, ... }:
  {
    homeManager =
    { pkgs, ... }:
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];
             
      sops.defaultSopsFile = ./secrets.yaml;
      sops.age = {
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        keyFile = "/var/lib/secrets/sops/age/keys.txt";
        generateKey = true;
      };
      sops.secrets."private_keys/github".path = "/home/${user.name}/.ssh/id_ed25519";
    
      home.sessionVariables.SOPS_AGE_KEY_FILE = "/var/lib/secrets/sops/age/keys.txt";
      home.packages = [ pkgs.sops ];
    };
    nixos = {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      sops.defaultSopsFile = ./secrets.yaml;
      sops.age = {
        sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        keyFile = "/var/lib/secrets/sops/age/keys.txt";
        generateKey = true;
      };
      sops.secrets."private_keys/github".path = "/home/${user.name}/.ssh/id_ed25519";
    };
  };
}

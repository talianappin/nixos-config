{ inputs, ... }:
let
  sops_config = {
    defaultSopsFile = ./secrets.yaml;
    
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/secrets/sops/age/keys.txt";
      generateKey = true;
    };

    secrets = {
      "private_keys/talianappin" ={
        path = ({ user, ... }: {"/home/${user.name}/.ssh/id_ed25519"});
      };
    };
  };
in
{
  sys.secrets = {
    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.sops-nix.homeManagerModules.sops ];
        sops = sops_config;
        home.sessionVariables.SOPS_AGE_KEY_FILE = sops_config.age.keyFile;
        home.packages = [ pkgs.sops ];
      };
    nixos = {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      sops = sops_config;
    };
  };
}

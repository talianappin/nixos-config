{ inputs, den, ... }:
{
  _module.args.__findFile = den.lib.__findFile;
  den.schema.user.includes = [ den._.mutual-provider ];
  flake.den = den;
  imports = [
    inputs.den.flakeModule
    (inputs.den.namespace "sys" true)
    (inputs.den.namespace "apps" true)
    (inputs.den.namespace "noctalia" true)
  ];
}

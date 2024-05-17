{ pkgs, ... }: {
  # Escolha do canal do nixpkgs
  channel = "stable-23.11"; # ou "unstable"

  # Pacotes necessários
  packages = [
    pkgs.bun
  ];

  # Variáveis de ambiente no workspace
  env = { };

  # Configuração do IDX
  idx = {
    # Extensões desejadas do open-vsx.org
    extensions = [
      # "vscodevim.vim"
    ];

    # Habilitar previews
    previews = {
      enable = true;
      previews = {
        web = {
          # Comando para rodar o servidor web
          command = [ "bun" "run" "build" ];
          manager = "web";
          env = {
            # Variáveis de ambiente para o servidor
            PORT = "$PORT";
          };
        };
      };
    };

    # Hooks do ciclo de vida do workspace
    workspace = {
      # Executado quando o workspace é criado pela primeira vez
      onCreate = {
        command = "bun install";
      };
      # Executado quando o workspace é iniciado
      onStart = {
        command = "bun run build";
      };
    };
  };
}

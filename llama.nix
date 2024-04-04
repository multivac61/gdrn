{ pkgs, ... }:
{
  services = {
    llama-cpp = {
      enable = true;
      model = pkgs.fetchurl {
        url = "https://huggingface.co/TheBloke/CapybaraHermes-2.5-Mistral-7B-GGUF/resolve/main/capybarahermes-2.5-mistral-7b.Q5_K_M.gguf";
	hash = "sha256-j2nOcsWDar1Upz9DwsdWvG9fJo169L6pge5qQBYPTYY=";
      };
    };
  };
}

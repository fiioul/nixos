# sudo nix run github:nix-community/disko -- --mode zap_create_mount ./disko-luks-ext4.nix

{
 disko.devices = {
  disk = {
    nvme = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            name = "ESP";
            start = "1MiB";
            end = "512MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
              ];
            };
          }
          {
            name = "luks";
            start = "512MiB";
            end = "100%";
            content = {
              type = "luks";
              name = "crypted-root";
              content = {
                type = "filesystem";
		format = "ext4";
                mountpoint = "/";
                mountOptions = ["noatime"];
              };
            };
          }
        ];
      };
    };
  };
 };
}

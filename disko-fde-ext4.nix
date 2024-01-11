layout using nix:

{
  disk = {
    nvme = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            type = "partition";
            name = "ESP";
            start = "1MiB";
            end = "512MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              options = [
                "defaults"
              ];
            };
          }
          {
            type = "partition";
            name = "luks";
            start = "512MiB";
            end = "100%";
            content = {
              type = "luks";
              name = "crypted-root";
              content = {
                type = "ext4";
                mountpoint = "/";
                mountOptions = ["noatime"];
                subvolumes = {
                  "/home" = {};
                };
              };
            };
          }
        ];
      };
    };
  };
}

{ ... }:
{
    programs.gBar = {
        enable = true;
        config = {
            CPUThermalZone = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input";
            Location = "T";
            SuspendCommand = "systemctl suspend";
            LockCommand = "loginctl lock-session";
            ExitCommand = "uwsm stop";
            DateTimeStyle = "%a %D %H:%M:%S";
            DiskPartition = "/home";
            BatteryFolder = "/sys/class/power_supply/BAT0";

            AudioRevealer = false;
            AudioInput = true;

            EnableSNI = false;

            NetworkWidget = true;
            NetworkAdapter = "wlp0s20f3";

            NumWorkspaces = 9;
            UseHyprlandIPC = true;
        };
        extraConfig = ''
            CenterWidgets: true

            WidgetsLeft: [Workspaces]

            WidgetsCenter: [Time]

            WidgetsRight: [Audio, Bluetooth, Network, Disk, RAM, CPU, Battery, Power]
        '';
        extraCSS = builtins.readFile ./gBar.css;
    };
}

{ ... }:
{
    console.keyMap = "dvorak";

    services.tlp = {
        enable = true;
        settings = {
            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        };
    };
}

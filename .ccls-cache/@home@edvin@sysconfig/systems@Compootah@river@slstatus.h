/* slstatus configuration */
/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

/* output formats */
static const struct arg args[] = {
	/* function, format, argument */
    { run_command, " %s ", "mpc --format '%artist% - %title%' | head -1"},
    { run_command, "%s | ", "mpc status '[%currenttime%/%totaltime%] %state% @ %kbitrate%kbps'"},
    { cpu_perc,     "CPU: %s%% | ", "NULL" },
    { ram_used,   "RAM: %sB | ", "NULL" },
    { datetime, "%s ", "%a %d %H:%M:%S" },
};

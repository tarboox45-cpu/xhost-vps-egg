#!/bin/sh

# X-Host VPS Color Scheme
PRIMARY='\033[0;38;5;69m'
SECONDARY='\033[0;38;5;99m'
ACCENT='\033[0;38;5;168m'
SUCCESS='\033[0;38;5;113m'
WARNING='\033[0;38;5;221m'
ERROR='\033[0;38;5;203m'
INFO='\033[0;38;5;117m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# Enhanced logger function
log() {
    level=$1
    message=$2
    case "$level" in
        "SUCCESS") color="$SUCCESS" ;;
        "WARNING") color="$WARNING" ;;
        "ERROR") color="$ERROR" ;;
        "INFO") color="$INFO" ;;
        *) color="$PRIMARY" ;;
    esac
    printf "${color}${BOLD}▶${NC} ${color}$message${NC}\n"
}

# Function to detect architecture
detect_architecture() {
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64)
            echo "amd64"
        ;;
        aarch64)
            echo "arm64"
        ;;
        riscv64)
            echo "riscv64"
        ;;
        *)
            log "ERROR" "Unsupported CPU architecture: $ARCH" >&2
            return 1
        ;;
    esac
}

# Function to print the main banner
print_main_banner() {
    printf "\033c"
    printf "${PRIMARY}╭─────────────────────────────────────────────────────────────────────────────╮${NC}\n"
    printf "${PRIMARY}│                                                                             │${NC}\n"
    printf "${PRIMARY}│  ${BOLD}${SECONDARY}╔═╗${PRIMARY}  ${BOLD}${SECONDARY}╔╦╗${PRIMARY}  ${BOLD}${SECONDARY}╦ ╦${PRIMARY}  ${BOLD}${SECONDARY}╔═╗${PRIMARY}  ${BOLD}${SECONDARY}╦╔═${PRIMARY}  ${BOLD}${SECONDARY}╔═╗${PRIMARY}  ${BOLD}${SECONDARY}╔═╗${PRIMARY}  ${BOLD}${SECONDARY}╔═╗${PRIMARY}  ${BOLD}${SECONDARY}╦  ╦${PRIMARY}  ${BOLD}${SECONDARY}╔═╗${PRIMARY}                    │${NC}\n"
    printf "${PRIMARY}│  ${BOLD}${SECONDARY}╠═╣${PRIMARY}  ${BOLD}${SECONDARY}║║║${PRIMARY}  ${BOLD}${SECONDARY}╠═╣${PRIMARY}  ${BOLD}${SECONDARY}║ ║${PRIMARY}  ${BOLD}${SECONDARY}╠╩╗${PRIMARY}  ${BOLD}${SECONDARY}╠═╝${PRIMARY}  ${BOLD}${SECONDARY}╠═╣${PRIMARY}  ${BOLD}${SECONDARY}║╣ ${PRIMARY}  ${BOLD}${SECONDARY}║  ║${PRIMARY}  ${BOLD}${SECONDARY}╠═╣${PRIMARY}                    │${NC}\n"
    printf "${PRIMARY}│  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}  ${BOLD}${SECONDARY}╚═╝${PRIMARY}  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}  ${BOLD}${SECONDARY}╩  ${PRIMARY}  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}  ${BOLD}${SECONDARY}╚═╝${PRIMARY}  ${BOLD}${SECONDARY}╩═╝╩${PRIMARY}  ${BOLD}${SECONDARY}╩ ╩${PRIMARY}                    │${NC}\n"
    printf "${PRIMARY}│                                                                             │${NC}\n"
    printf "${PRIMARY}│                    ${SUCCESS}${BOLD}🚀 X Host VPS Management Platform 🚀${PRIMARY}                    │${NC}\n"
    printf "${PRIMARY}│                                                                             │${NC}\n"
    printf "${PRIMARY}│         ${DIM}${INFO}High Performance • Secure • Reliable • Scalable${PRIMARY}         │${NC}\n"
    printf "${PRIMARY}│                    ${DIM}${INFO}Customized by tarboox45-cpu${PRIMARY}                    │${NC}\n"
    printf "${PRIMARY}│                                                                             │${NC}\n"
    printf "${PRIMARY}╰─────────────────────────────────────────────────────────────────────────────╯${NC}\n"
    printf "\n"
}

# Function to print the help banner
print_help_banner() {
    printf "${SECONDARY}╭─────────────────────────────────────────────────────────────────────────────╮${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}│                   ${BOLD}${INFO}📋 X Host VPS Commands 📋${SECONDARY}                   │${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}├─────────────────────────────────────────────────────────────────────────────┤${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}│  ${INFO}●${NC} ${BOLD}clear, cls${NC}     ${SUCCESS}↪${NC} Clear terminal screen                          ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${ERROR}●${NC} ${BOLD}exit${NC}          ${SUCCESS}↪${NC} Shutdown container server                      ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${ACCENT}●${NC} ${BOLD}history${NC}       ${SUCCESS}↪${NC} Display command history                        ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${INFO}●${NC} ${BOLD}reinstall${NC}      ${SUCCESS}↪${NC} Reinstall operating system                     ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${SUCCESS}●${NC} ${BOLD}install-ssh${NC}    ${SUCCESS}↪${NC} Install custom SSH server                      ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${PRIMARY}●${NC} ${BOLD}status${NC}        ${SUCCESS}↪${NC} Show detailed system status                    ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${WARNING}●${NC} ${BOLD}backup${NC}        ${SUCCESS}↪${NC} Create complete system backup                  ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${ACCENT}●${NC} ${BOLD}restore${NC}       ${SUCCESS}↪${NC} Restore from system backup                     ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│  ${INFO}●${NC} ${BOLD}help${NC}          ${SUCCESS}↪${NC} Display this help information                  ${SECONDARY}│${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}├─────────────────────────────────────────────────────────────────────────────┤${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}│            ${DIM}${INFO}💡 Tip: Type any command above to get started!${SECONDARY}            │${NC}\n"
    printf "${SECONDARY}│                                                                             │${NC}\n"
    printf "${SECONDARY}╰─────────────────────────────────────────────────────────────────────────────╯${NC}\n"
    printf "\n"
}
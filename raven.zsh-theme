# "Raven" theme for ZSH by RG
# Version 2.1
# This version supports the following platforms:
# Android - Termux
# Android - Terminal emulators
# Android - ADB shell
# Most Linux distros
# Cygwin on supported Windows versions

ZSH_THEME_GIT_PROMPT_PREFIX=".[%{$fg[magenta]%}git:%{$reset_color%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Cygwin/MINGW stuff
function nt_name () {
	local ntver=$(uname|grep -oP '(?<=CYGWIN_).*' || uname | grep -oP '(?<=MINGW(64|32)_).*(?=-.*)' || echo "NOT NT")
	case $ntver in
		NT-4.0) echo "Windows NT 4.0" ;;
		NT-4.10) echo "Windows 98" ;;
		NT-5.0) echo "Windows 2000" ;;
		NT-4.9*) echo "Windows ME" ;;
		NT-5.1) echo "Windows XP" ;;
		NT-5.2) echo "Windows XP x64" ;;
		NT-6.0) echo "Windows Vista" ;;
		NT-6.1) echo "Windows 7" ;;
		NT-6.2) echo "Windows 8" ;;
		NT-6.3) echo "Windows 8.1" ;;
		NT-6.*) echo "Windows 10 TP" ;;
		NT-10*) echo "Windows 10" ;;
		NT-11*) echo "Windows 11" ;;
		NT*) echo "Windows $ntver" ;;
		"NOT NT") echo "NOTNT" ;;
		*) echo "$(uname -o)" ;;
	esac
}
#####################

WINVER=$(nt_name)
#echo "WINVER: $WINVER"
if [[ $WINVER == "NOTNT" ]]; then
	#echo "Not running Windows"
	unset WINVER
	unset -f nt_name
else
	#echo "Running Windows"
	RAVEN_INIT_RUNNING_WINDOWS="true"
	#echo $RAVEN_INIT_RUNNING_WINDOWS
fi

if [[ $TITLE == "" ]]; then
  export TITLE="Raven"
fi

function get_title () {
  if [[ $TITLE == '' ]]; then
    export TITLE=">>"
    echo $TITLE
  else
    echo "<$TITLE> %{$reset_color%}-"
  fi
}

function and_codename () {
  if [[ $(uname -o) == *Android* ]]; then
    echo "%{$fg[green]%}@%B$(getprop ro.product.name || echo android)%b%{$reset_color%}"
  fi
}
if [[ $(uname -o) == *Android* ]]; then
	RAVEN_ANDROID_PRODUCT_NAME=$(and_codename)
else
	unset -f and_codename
fi

function refresh_hostname () {
  if ! [[ $(hostname) == "localhost" ]]; then
    RAVEN_HOSTNAME="@$(hostname)"	
  elif [[ $(uname -o) == *Android* ]]; then
    RAVEN_HOSTNAME="${RAVEN_ANDROID_PRODUCT_NAME}"
  else
	RAVEN_HOSTNAME="@$(hostname)"
  fi
}

refresh_hostname

function p_symbol () {
  if [[ $UID == 0 ]]; then
    echo "#"
  else
    echo "%%"
  fi
}

function u_name () {
  if [[ $(whoami) == root ]]; then
    echo "%{$fg[red]%}$(whoami)"
  elif [[ $(whoami) == shell ]] && [[ $(RAVEN_ANDROID_PRODUCT_NAME) != "" ]]; then
    echo "%{$fg[orange]%}adb:$(whoami)"
  elif [[ $RAVEN_INIT_RUNNING_WINDOWS == "true" ]]; then
    #echo "Running Windows: Running Windows = $RAVEN_INIT_RUNNING_WINDOWS" > /dev/stderr
	echo "%{$fg[cyan]%}[${WINVER}]%{$fg[blue]%}$(whoami)"
  else
    echo "%{$fg[blue]%}$(whoami)"
  fi
}

RAVEN_USERNAME=$(u_name)


PROMPT='%{$fg[blue]%}$(get_title)%{$reset_color%} %{$fg[green]%}%0~ %{$reset_color%}$(git_prompt_info) 
%B${RAVEN_USERNAME}%b%{$reset_color%}%{$fg[yellow]%}${RAVEN_HOSTNAME}%{$reset_color%} $(p_symbol) '
RPROMPT='%(?..%{$bg[red]%}%{$fg[white]%}%B%?%b%{$reset_color%})'


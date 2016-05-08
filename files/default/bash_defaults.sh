# Produced by Chef -- changes will be overwritten

#------------------------------------------------------------------------------
# FUNCTIONS
#------------------------------------------------------------------------------

# function: histroy_to_syslog
function history_to_syslog () {
  declare cmd;
  cmd=$(fc -ln -0 2>/dev/null);
  logger -p auth.notice -- SESSION = $$, CMD =$cmd;
}

#------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------

# init /etc/profile when using bash
alias bash='bash --init-file /etc/profile';

# set history management
trap history_to_syslog DEBUG;
export readonly HISTFILE=/dev/null;

# set PS1
if [ $(id -u) -eq 0 >/dev/null  2>&1 ]; then
  export PS1="[\[\e[0;31m\]\u\[\e[0m\]@\h \W]\\$ ";
else
  export PS1="[\u@\h \W]\\$ ";
fi

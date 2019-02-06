APP_ID=$1
DIR=$2
LOGIN=$3
BIT=$4
BETA=$5
BETAN=$6

if [ -z "$APP_ID" ]; then
  echo "Correct usage: ./gup.sh (App ID) (Directory) (Login) (Bit) (Beta) (Beta name)"
  exit
fi
if [ -z "$BIT" ]; then
  BIT="64"
fi
if [ ! -z "$BETA" ]; then
  if [ -z "$BETAN" ]; then
    echo "Error: The beta name was never set."
    exit
  fi
fi
if [ $BIT != "64" ]; then
  if [ $BIT != "32" ]; then
    echo "Error: Bit platform was set incorrectly. $BIT Was originally set, and will not work."
    exit
  fi
fi
if [ -z "$LOGIN" ]; then
  USR="anonymous"
  PWD=""
elif [ "$LOGIN" == "anon" ]; then
  USR="anonymous"
  PWD=""
elif [ "$LOGIN" == "u1" ]; then
  USR=""
  PWD=""
elif [ "$LOGIN" == "u2" ]; then
  USR=""
  PWD=""
fi
if [ ! -d "$HOME/$DIR" ]; then
  mkdir -p "$HOME/$DIR"
fi
if [ ! -d "$HOME/$DIR" ]; then
  echo "Error: Cannot create directory $HOME/$DIR"
  exit
fi

if [ ! -z "$BETA" ]; then
  if [ -z "$PWD" ]; then
    $HOME/steamcmd.sh +@sSteamCmdForcePlatformBitness $BIT +login $USR +force_install_dir "$HOME/$DIR" +app_update $APP_ID -beta $BETAN validate +quit
  else
    $HOME/steamcmd.sh +@sSteamCmdForcePlatformBitness $BIT +login $USR $PWD +force_install_dir "$HOME/$DIR" +app_update $APP_ID -beta $BETAN validate +quit
  fi
  exit
fi
if [ -z "$PWD" ]; then
  $HOME/steamcmd.sh +@sSteamCmdForcePlatformBitness $BIT +login $USR +force_install_dir "$HOME/$DIR" +app_update $APP_ID validate +quit
else
  $HOME/steamcmd.sh +@sSteamCmdForcePlatformBitness $BIT +login $USR $PWD +force_install_dir "$HOME/$DIR" +app_update $APP_ID validate +quit
fi
exit
gup.sh
Displaying gup.sh.
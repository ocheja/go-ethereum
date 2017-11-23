#cd $ETHEREUM_HOME | make all
if [ ! -d "/etc/blockchain" ]; then
    sudo mkdir /etc/blockchain && sudo mkdir /etc/blockchain/nodes && sudo mkdir /etc/blockchain/nodes/node-1 && sudo mkdir /etc/blockchain/nodes/node-2
    #echo "ETHEREUM_DATADIR='/etc/blockchain'" | sudo tee --append /home/$USER/.bash_profile && source /home/$USER/.bash_profile 
elif [ ! -d "$ETHEREUM_DATADIR/nodes" ]; then
    sudo mkdir $ETHEREUM_DATADIR/nodes && sudo mkdir $ETHEREUM_DATADIR/nodes/node-1 && sudo mkdir $ETHEREUM_DATADIR/nodes/node-2 
fi
if [ ! -d "$ETHEREUM_DATADIR/nodes/node-1" ]; then
    sudo mkdir $ETHEREUM_DATADIR/nodes/node-1 && $ETHEREUM_HOME/build/bin/geth --datadir $ETHEREUM_DATADIR/nodes/node-1 init $ETHEREUM_HOME/genesis.json
fi
if [ ! -d "$ETHEREUM_DATADIR/nodes/node-2" ]; then
    sudo mkdir $ETHEREUM_DATADIR/nodes/node-2 && $ETHEREUM_HOME/build/bin/geth --datadir $ETHEREUM_DATADIR/nodes/node-2 init $ETHEREUM_HOME/genesis.json
fi
if [ ! "$(ls -A $ETHEREUM_DATADIR/nodes/node-1)" ]; then
    $ETHEREUM_HOME/build/bin/geth --datadir $ETHEREUM_DATADIR/nodes/node-1 init $ETHEREUM_HOME/genesis.json
fi
if [ ! "$(ls -A $ETHEREUM_DATADIR/nodes/node-2)" ]; then
    $ETHEREUM_HOME/build/bin/geth --datadir $ETHEREUM_DATADIR/nodes/node-2 init $ETHEREUM_HOME/genesis.json
fi

#!/bin/sh

echo "Starting Ethereum Service..."

# show backtraces
export RUST_BACKTRACE=1
export RUST_LOG=info

ethereum-launcher &

echo "Starting Ethereum Network Intelligence API..."
cd /dashboard-app/eth-net-intelligence-api

cat <<EOF >app.json
[
  {
    "name"              : "node-app",
    "script"            : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"        : false,
    "watch"             : false,
    "max_restarts"      : 10,
    "exec_interpreter"  : "node",
    "exec_mode"         : "fork_mode",
    "env":
    {
      "NODE_ENV"        : "production",
      "RPC_HOST"        : "localhost",
      "RPC_PORT"        : "8545",
      "LISTENING_PORT"  : "30303",
      "INSTANCE_NAME"   : "FST Network PP Blockchain Dashborad",
      "CONTACT_DETAILS" : "",
      "WS_SERVER"       : "http://localhost:3000",
      "WS_SECRET"       : "hello",
      "VERBOSITY"       : 2
    }
  }
]
EOF
pm2 start app.json &

echo "Starting Ethereum Network Stats..."
cd /dashboard-app/eth-netstats
WS_SECRET="hello" exec npm start

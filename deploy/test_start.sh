



echo "starting node apps"
node app1.js &
app1pid=$!
node app2.js &
app2pid=$!

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT SIGINT SIGTERM


function ctrl_c() {
        echo "** Trapped CTRL-C or other interrupt"
        kill $app1pid;
        kill $app2pid;
}


wait
echo "node apps complete"





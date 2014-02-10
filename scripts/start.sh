echo "Starting ScriptEd Platform (Env: $ENV_NAME)"


SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done



#dir is pointing to the deploy directory
#script_dir is pointing at the script location
export deploy_dir="$( cd -P "$( dirname "$SOURCE" )" && cd ../deploy &&  pwd )"
#dir="$( cd -P "$( dirname "$SOURCE" )" && cd ../deploy &&  pwd )"
export script_dir="$( cd -P "$( dirname "$SOURCE" )" &&  pwd )"


#echo "dir in START script is $dir"
#echo "script dir in START script is $script_dir"

echo " "
echo "deploy dir is $deploy_dir"
echo " "



PLATFORM_PORT=8080
JSBIN_PORT=8081
CLOUD9_PORT=8082

#platform
cd $deploy_dir/platform; 
PORT=$PLATFORM_PORT bin/platform &
platform_pid=$!

#jsbin
cd $deploy_dir/platform-jsbin
PORT=$JSBIN_PORT bin/platform-jsbin &
jsbin_pid=$!

#cloud9
cd $deploy_dir/platform-cloud9;
PORT=$CLOUD9_PORT bin/platform-cloud9 &
cloud9_pid=$!



trap ctrl_c INT SIGINT SIGTERM


function ctrl_c() {
        echo "Shutting down ScriptEd Platform (Env: $ENV_NAME)"
        kill $jsbin_pid;
        kill $cloud9_pid;
        kill $platform_pid;
}


wait
echo "COMPLETED: ScriptEd Environment (Env: $ENV_NAME)"


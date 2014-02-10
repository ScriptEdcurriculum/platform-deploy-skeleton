rm /var/log/env.sh.log
rm /var/log/env.sh.err



scripts/env.sh start

sleep 1;

echo "------ERR IS--------"
echo ""
cat /var/log/env.sh.err
echo ""
echo ""


echo "------LOG IS--------"
echo ""
cat /var/log/env.sh.log
echo ""
echo ""


echo "------RUNNING PROCESSES ARE--------"
echo ""
ps ax | grep platform
echo ""
echo ""


echo "Stopping application....."
echo ""
echo ""
scripts/env.sh stop
echo ""
echo ""

sleep 1
echo "------RUNNING PROCESSES ARE--------"
echo ""
ps ax | grep platform
echo ""
echo ""


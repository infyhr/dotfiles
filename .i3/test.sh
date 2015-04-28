test=`sensors | grep -n 'temp1' | sed -n 2p | awk -F'+' '{print $2}' | awk -F' ' '{print $1}';`
echo $test;


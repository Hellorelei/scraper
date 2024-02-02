#!/bin/bash
for i in {1..100000}; do
    waittime=$RANDOM
    echo ""
    let "waittime %= 5"
    echo "    \033[1mLooking for file quest_$i.txt, delay: $waittime.\033[0m"
    if ! test -s "quest_$i.txt"; then
        echo "        \033[96mFile does not exist\033[0m; fetching..."
        printf -v url "https://www.wowhead.com/quest=%d" $i
        curl -m 5 -L $url >> "quest_$i.txt"
        echo "        \033[1m\033[92mFile found and downloaded. Waiting for $waittime.\033[0m"
        sleep $waittime
    fi
done
kill $(ps aux | grep ghost/index.js | awk '{print $2}')

kill $(ps aux | grep nodebb/app.js | awk '{print $2}')

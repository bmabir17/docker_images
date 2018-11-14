#!/bin/bash
git clone https://nsabir2011:MononAI0@github.com/bmabir17/FaceRecogAndLog.git -b develop
wait
cd FaceRecogAndLog
cd stream_server/client
npm install
npm run-script build

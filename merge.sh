###
 # @Description: 
 # @Author: Linxian Hong
 # @Date: 2021-08-18 15:32:41
 # @LastEditTime: 2021-08-18 16:01:22
 # @LastEditors: Linxian Hong
### 

#!/bin/sh
(
  echo "Do one thing"
  echo "Do another thing"
  if true
  then
    exit 3  # <-- this is our simulated bailing out
  fi
  echo "Do yet another thing"
  echo "And do a last thing"
)   # <-- here we arrive after the simulated bailing out, and $? will be 3 (exit code)
if [ $? = 3 ]
then
  echo "Bail out detected"
fi
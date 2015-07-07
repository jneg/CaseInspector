CaseInspector() {
   for inFile in $TEST_DIR/*$IN_SUFFIX
   do
      echo "Testing ${inFile}..."

      if [ ! -e ${inFile%$IN_SUFFIX}$OUT_SUFFIX ]
      then
         echo "[!] ${inFile%$IN_SUFFIX}$OUT_SUFFIX does not exist"
         continue
      fi

      ./$EXEC_NAME < $inFile 1>$TEMP_OUT 2>&1
      diff $TEMP_OUT ${inFile%$IN_SUFFIX}$OUT_SUFFIX
   done

   rm $TEMP_OUT
}

CheckArgs() {
   if [ ! -e $EXEC_NAME ]
   then
      echo "[!] $EXEC_NAME does not exist"
      exit 1
   fi

   if [ ! -f $EXEC_NAME ]
   then
      echo "[!] $EXEC_NAME is not a regular file"
      exit 1
   fi

   if [ ! -x $EXEC_NAME ]
   then
      echo "[!] $EXEC_NAME can not be executed"
      exit 1
   fi

   if [ ! -e $TEST_DIR  ]
   then
      echo "[!] $TEST_DIR does not exist"
      exit 1
   fi

   if [ ! -d $TEST_DIR ]
   then
      echo "[!] $TEST_DIR is not a directory"
      exit 1
   fi

   if [ ! -x $TEST_DIR  ]
   then
      echo "[!] $TEST_DIR can not be executed"
      exit 1
   fi

   if [ ! -r $TEST_DIR ]
   then
      echo "[!] $TEST_DIR can not be read"
      exit 1
   fi
}

main() {
   echo "Running CaseInspector..."

   echo "Checking Arguments..."
   CheckArgs
   
   echo "Inspecting Cases..."
   CaseInspector
}

readonly EXEC_NAME=$1
readonly TEST_DIR=$2
readonly IN_SUFFIX=".in"
readonly OUT_SUFFIX=".out"
readonly TEMP_OUT="curTest.temp.out"

shopt -s nullglob

main

#!/bin/sh
CONF_ROOT="../confRoot"
CONF_DETAIL="../confDetail"

function release(){
   if [ $# -lt 2 ]; then
      echo "Usage: sh release.sh <release setting> <release dir>"
      exit 1
   fi

   RELEASE_SETTING="$1"
   RELEASE_DETAIL="${1}Settings"
   RELEASE_DIR=`realpath $2`
   RELEASE_CONF_ROOT=`realpath ${CONF_ROOT}/${RELEASE_SETTING}`
   RELEASE_SETTING_PATH=`realpath ~/`
   RELEASE_CONF_DETAIL=`realpath ${CONF_DETAIL}/${RELEASE_DETAIL}`

   checkParam ${RELEASE_SETTING} ${RELEASE_DIR}

   echo ""
   echo "======= Release ${RELEASE_SETTING} ======="
   echo "[Contents]"
   echo "  .${RELEASE_SETTING}"
   echo "  ${RELEASE_DETAIL}/*"

   # 設定の大本を設置(.bashrcなど)
   # ~/ 以下に設置する
   
   echo "# put conf root"
   cp ${RELEASE_CONF_ROOT} ${RELEASE_SETTING_PATH}/.${RELEASE_SETTING}
   echo "cp ${RELEASE_CONF_ROOT}   ${RELEASE_SETTING_PATH}/.${RELEASE_SETTING}"
   echo "SETTINGS_DIR=\"${RELEASE_DIR}\"" >> ${RELEASE_SETTING_PATH}/.${RELEASE_SETTING}
   echo ". \${SETTINGS_DIR}/${RELEASE_SETTING}Base" >> ${RELEASE_SETTING_PATH}/.${RELEASE_SETTING}
 
   echo "# put conf detail"
   mkdir -p ${RELEASE_DIR}
   cp ${RELEASE_CONF_DETAIL}/* ${RELEASE_DIR}

   echo ""
   echo "## finish"
}

function checkParam(){
   echo "======= check parameter ======="
   local RES=1

   if [ ! -e ${RELEASE_CONF_ROOT} ]; then
      echo "${RELEASE_SETTING} is not existing setting..."
      RES=0
   elif [ ! -f ${RELEASE_CONF_ROOT} ]; then
      RES=0
      echo "${RELEASE_SETTING} is unreleasable(${RELEASE_CONF_ROOT} is not a file)."
   fi
   if [ ! -e ${RELEASE_CONF_DETAIL} ]; then
      echo "${RELEASE_CONF_DETAIL} is not existing..."
      RES=0
   elif [ ! -d ${RELEASE_CONF_DETAIL} ]; then
      RES=0
      echo "${RELEASE_SETTING} is unreleasable(${RELEASE_CONF_DETAIL} is not a directory)."
   fi
   if [ -e ${RELEASE_DIR} ]; then
      if [ ! -d  ${RELEASE_DIR} ]; then
         RES=0
         echo "${RELEASE_DIR} is not a directory."
      fi
      if [ ! -w ${RELEASE_DIR} ]; then
         RES=0
         echo "Permission Denied about ${RELEASE_DIR}(cannot write)."
      fi
   fi
   if [ ${RES} -eq 1 ]; then
      echo "Result:[OK]"
      echo "==============================="
   else
      echo "Result:[NG]"
      echo "   There are some problems"
      echo "==============================="
      exit 1
   fi
}


         #.bashrcを設置
         echo "SETTINGS_DIR=\"/home/takefumi.ota/tmp/bashrcSettings\"" 
         echo ". \${SETTINGS_DIR}/bashrcBase" 
         #.bashrc用の設定を設置


release $1 $2


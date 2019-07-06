#!/bin/bash
# ----------------------------------
# Author: astenix
# The script engage glossaries and index in project
# echo -e добавляет перенос строки через \n

echo -e "\n= = = = START" 

echo -e "\n = = = Build main.pdf first \n"
./buildWithMetafilesInFolderApart.sh

echo -e "\n= = = Go to project_metafiles folder"
cd ../project_metafiles/

echo -e "\n= = = Do Index \n" 

makeindex main.idx

echo -e "\n= = = Do Glossary \n" 

makeglossaries main.glo

echo -e "\n= = = Return to /scripts folder" 

cd ../scripts

echo -e "\n = = = Build main.pdf again (in silence mode \n"
./buildWithMetafilesInFolderApart.sh &> /dev/null

echo -e "\n= = = = DONE \n"
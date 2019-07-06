#!/bin/bash
# ----------------------------------
# Author: astenix
# 12 june 2019
# The script build LaTeX project with outputing all metafiles in folder project_metafiles
# echo -e добавляет перенос строки через \n

echo -e "\n= = = = START \n"

echo -e "\n= = = Build PdfLaTeX \n"

cd ../

    # Запустить PpdfLaTeX
pdflatex -output-directory=project_metafiles main

    # В project_metafiles/ появляются
        # main.aux
        # main.glo
        # main.idx
        # main.log
        # main.out
        # main.pdf
        # main.xdy

echo -e "\n= = = Build BibTeX \n"

    # Переместить файл main.aux на уровень выше
mv project_metafiles/main.aux ./main.aux

    # запустить bibtex main (читается main.aux)
    # чтобы появились
        # main.bbl
        # main.blg
bibtex main

    # Переместить новые файлы в project_metafiles
mv main.aux main.bbl main.blg project_metafiles/

    # main.aux
    # main.bbl
    # main.blg    

echo -e "\n= = = Rebuild PdfLaTeX \n"

    # Снова запустить pdflatex, но уже в silence mode
pdflatex -output-directory=project_metafiles main  &> /dev/null

    # echo -e "\n= = = Move main.pdf to project root folder \n"
mv project_metafiles/main.pdf ./main.pdf

    # echo -e "\n= = = = Return to my_scripts/ \n"
# cd my_scripts/
cd -

echo -e "\n= = = = DONE \n"

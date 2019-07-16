#!/bin/bash
# ----------------------------------
# Author: Alexei Lupan
# The script delete technical files from project rest after closing Kile.
# It doesnt' ask questions. It is ireversible.
# Man: https://losst.ru/komanda-find-v-linux
# echo -e добавляет перенос строки через \n

echo -e "\nList of removed files: \n"
    # ../ 
        # Подняться на уровень выше (ведь скрипт лежит в подкаталоге).
    # -not -path "../.git/*"
        # Убрать из поиска каталог .git, бо там тоже хранятся файлы 
        # с расширениями "для удаления", и если их убрать, поломается
        # синхронизация с репозиториями в git.
    # -regex '.*\.\(aux\...
        # Выполнить поиск по расширениям файлов согласно регулярке.
    # -print
        # Вывести список найденных файлов. Просто для информации.
    #-delete
        # Удалить все файлы из этого списка.
        # Опция -delete всегда в конце всей команды! 
            # Иначе будут удалены ВСЕ файлы в корне, включая файлы, 
            # которые не заканчиваются на указаные расширения, и файлы 
            # в глубоких суб-суб-каталогах.

find ../ -not -path "../.git/*" -regex '.*\.\(aux\|backup\|bib~\|dvi\|gitignore~\|glg\|glo\|glo\|gls\|idx\|ind\|ilg\|log\|out\|plt\|ps\|sh~\|sty~\|tex~\|toc\||gz\|xdy\)' -print -delete

echo -e "\n= = = = DONE \n"
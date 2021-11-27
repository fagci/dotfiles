#!/bin/bash
# Перекодирует рекурсивно в текущем каталоге имена
# файлов и каталогов в транслит.
#
# Improved by Dumitru Uzun (https://DUzun.Me)
#
# Источник: http://www.ubuntu.sumy.ua/2011/03/translit.html

shopt -s nullglob

# translit "стринг"
# echo "текст" | translit
# translit <<< "стдин"
translit() {
    local NAME=${*:-$(cat)};
    local TRS;
    TRS=$(sed "y/абвгдезийклмнопрстуфхцы/abvgdezijklmnoprstufxcy/" <<< "$NAME")
    TRS=$(sed "y/АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ/ABVGDEZIJKLMNOPRSTUFXCY/" <<< "$TRS")
    TRS=${TRS//ч/ch};
    TRS=${TRS//Ч/CH} TRS=${TRS//ш/sh};
    TRS=${TRS//Ш/SH} TRS=${TRS//ё/jo};
    TRS=${TRS//Ё/JO} TRS=${TRS//ж/zh};
    TRS=${TRS//Ж/ZH} TRS=${TRS//щ/sh\'};
    TRS=${TRS///SH\'} TRS=${TRS//э/je};
    TRS=${TRS//Э/JE} TRS=${TRS//ю/ju};
    TRS=${TRS//Ю/JU} TRS=${TRS//я/ja};
    TRS=${TRS//Я/JA} TRS=${TRS//ъ/\`};
    TRS=${TRS//ъ\`} TRS=${TRS//ь/\'};
    TRS=${TRS//Ь/\'}
    hash iconv &> /dev/null && TRS=$(iconv -c -f UTF8 -t ASCII//TRANSLIT <<< "$TRS")
    echo "$TRS";
}

trans_mv() {
    local dir=${1:-$PWD}
    for NAME in "$dir"/* ; do
        TRS=$(translit <<< "${NAME// /_}")
        if [ "$NAME" != "$TRS" ]; then
            # echo "\"$NAME\" -> \"$TRS\""
            mv -v "$NAME" "$TRS"
        fi
        if [ -d "$TRS" ]; then
            trans_mv "$TRS"
        fi
    done

}

trans_mv "$1"

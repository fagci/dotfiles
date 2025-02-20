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
    TRS=$(tr "абвгдезийклмнопрстуфхцы" "abvgdezijklmnoprstufxcy" <<< "$NAME")
    TRS=$(tr "АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ" "ABVGDEZIJKLMNOPRSTUFXCY" <<< "$TRS")
    TRS=${TRS//ч/ch};
    TRS=${TRS//Ч/CH} TRS=${TRS//ш/sh};
    TRS=${TRS//Ш/SH} TRS=${TRS//ё/jo};
    TRS=${TRS//Ё/JO} TRS=${TRS//ж/zh};
    TRS=${TRS//Ж/ZH} TRS=${TRS//щ/sch};
    TRS=${TRS//Щ/SCH} TRS=${TRS//э/je};
    TRS=${TRS//Э/JE} TRS=${TRS//ю/ju};
    TRS=${TRS//Ю/JU} TRS=${TRS//я/ja};
    TRS=${TRS//Я/JA} TRS=${TRS//ъ/};
    TRS=${TRS//Ъ/} TRS=${TRS//ь/};
    TRS=${TRS//Ь/}
    TRS=${TRS//\"/}
    TRS=${TRS//,/_}
    TRS=${TRS//\'/}
    TRS=${TRS//\`/}
    hash iconv &> /dev/null && TRS=$(iconv -c -f UTF8 -t ASCII//TRANSLIT <<< "$TRS")
    echo "$TRS";
}

trans_mv() {
    local dir=${1:-$PWD}
    for NAME in "$dir"/* ; do
        TRS=$(translit <<< "${NAME// /_}")
        if [ "$NAME" != "$TRS" ]; then
            mv -v "$NAME" "$TRS"
        fi
        if [ -d "$TRS" ]; then
            trans_mv "$TRS"
        fi
    done

}

trans_mv "$1"

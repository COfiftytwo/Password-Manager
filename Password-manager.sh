#!/bin/bash

# データを保存するファイルのパス
data_file="passwords.txt"

echo "パスワードマネージャ"
while true; do
    echo "選んでください: (Add Password/Get Password/Exit)"
    read option

    if [ "$option" = "Add Password" ]; then
        # Add Password
        echo "サイト名を入力してください: "
        read site_name
        echo "IDを入力してください: "
        read user_id
        echo "パスワードを入力してください: "
        read password

        # データをファイルに追加
        echo "サイト名: $site_name" >> "$data_file"
        echo "ID: $user_id" >> "$data_file"
        echo "パスワード: $password" >> "$data_file"
        echo "データが保存されました."
    elif [ "$option" = "Get Password" ]; then
        # Get Password
        if [ -e "$data_file" ]; then

            echo "表示するサイト名を入力してください: "
            read selected_site

            # 選択されたサイト名のデータを表示
            grep -A 2 "サイト名: $selected_site" "$data_file" || echo "データがありません."
        else
            echo "データがありません."
        fi
    elif [ "$option" = "Exit" ]; then
        # Exit
        echo "ありがとうございました."
        exit 0
    else
        echo "無効な選択です. もう一度選んでください."
    fi
done

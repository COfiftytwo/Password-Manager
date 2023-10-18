#!/bin/bash

# データを保存するファイルのパス
data_file="passwords-save.txt"

echo "パスワードマネージャーへようこそ！"
while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read option

    if [ "$option" = "Add Password" ]; then
        # Add Password
        echo "サービス名を入力してください: "
        read site_name
        echo "ユーザー名を入力してください: "
        read user_id
        echo "パスワードを入力してください: "
        read password

        # データをファイルに追加
        echo "サービス名: $site_name" >> "$data_file"
        echo "ユーザー名: $user_id" >> "$data_file"
        echo "パスワード: $password" >> "$data_file"
        echo "Thank you!" #データを保存
    elif [ "$option" = "Get Password" ]; then
        # Get Password
        if [ -e "$data_file" ]; then
            echo "サービス名を入力してください："
            read selected_site

            # 選択されたサイト名のデータを表示
            grep -A 2 "サービス名: $selected_site" "$data_file" || echo "そのサービスは登録されていません"
        fi
    elif [ "$option" = "Exit" ]; then
        # Exit
        echo "Thank you!"
        exit 0
    else
        echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
    fi
done

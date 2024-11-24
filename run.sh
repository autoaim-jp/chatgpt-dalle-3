#!/bin/bash

source ./.env
mkdir -p ./result/

PROMPT=$(cat ./prompt.txt)
echo $PROMPT

# jq を使用して JSON を生成
JSON=$(jq -n --arg prompt "$PROMPT" --arg model "dall-e-3" --arg n "1" --arg size "1024x1024" \
  '{
    model: $model,
    prompt: $prompt,
    n: ($n | tonumber),
    size: $size
  }')

# デバッグ用に生成されたJSONを表示
echo "$JSON"

# curlでリクエストを送信
curl https://api.openai.com/v1/images/generations \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "$JSON"


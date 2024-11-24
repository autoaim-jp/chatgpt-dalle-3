#!/bin/bash

mkdir -p ./result/

# IMAGE_URL='https://oaidalleapiprodscus.blob.core.windows.net/private/org-b30oWbsKnWksqfc6sh1SI4Tg/user-B1URMzxu1DuPXTIQIfX3fTi3/img-BAjshLGJqlAF8A0UNkQXHu0w.png?st=2024-11-24T12%3A56%3A12Z&se=2024-11-24T14%3A56%3A12Z&sp=r&sv=2024-08-04&sr=b&rscd=inline&rsct=image/png&skoid=d505667d-d6c1-4a0a-bac7-5c84a87759f8&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-11-24T11%3A14%3A09Z&ske=2024-11-25T11%3A14%3A09Z&sks=b&skv=2024-08-04&sig=gUg0S6KmdnJK/ykYgOqg7wEjq1uphh4G0/fBJw/R8Y4%3D'

JSON_FILE_PATH=./result/output.json
IMAGE_URL=$(jq -r 'try .data[0].url // empty' ${JSON_FILE_PATH})

if [[ -n "$IMAGE_URL" ]]; then
  echo "$IMAGE_URL"
  curl -o ./result/generated_image.png "${IMAGE_URL}"
else
  echo "url not found."
  cat $JSON_FILE_PATH
fi


#!/bin/bash

while true; do
    read -p "Email Address: " email
    if [[ $email =~ ^[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:].]{2,4}$ ]]; then
        break
    else
        echo Invalid email pattern
    fi
done

read -sp "Password: " password
echo

url='<resource-endpoint>'
data='{
    "email":"'"$email"'",
    "password":"'"$password"'"
    }'

response=$(curl -s -w "\nHTTPSTATUS:%{http_code}\\n" -d "$data" -H "Content-Type: application/json" -X POST "$url")

HTTP_STATUS=$(echo $response | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')

if [[ $HTTP_STATUS -eq 201 ]]; then
    echo $response > ./response.txt #writes response of the request into a response.txt in this folder
    echo Authenticated Sucessfully
else
    echo unauthorized: incorrect email or password
fi

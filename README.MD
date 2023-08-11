# cli-login

I wanted to understand the flow of authenticating user login from the CLI so I wrote a basic shell script using bash. It turned out really great.

## How it works

This script basically recieves the user's email address and password, validates the email address, makes the request using curl and writes the response of the request to file name response.txt in the same folder (Default behaviour). You can read into the file to extract the token for subsequent request.

## Run Package

### Clone the project

```
git clone https://github.com/Vickysomtee/cli-authentication.git
```

### Go to the project directory

```
  cd cli-login
```

### Customize the script

Replace the `<resource-endpoint>` with your login endpoint
```sh
  url='<resource-endpoint>'
```

Replace the `./response.txt` with a symlink to your desired folder. You can leave the default file for the purpose of testing the script.
```sh
  echo $response > ./response.txt
```

### Run Script

```
  bash login.sh
```


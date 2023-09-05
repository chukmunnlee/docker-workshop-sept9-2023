# Deckofcards

## Setup Angular

Install the latest version of Node from [nodejs.org](https://nodejs.org/en/download). 

Open a terminal and xnstall Angular CLI with the following command `npm i -g @angular/cli`. Prefix the command with `sudo` if you are using OSX. See [angular.io](https://angular.io/cli) for detailed instructions.

## Compile Angular Application

List of required files and directories
-  angular.json
-  package.json
-  package-lock.json
-  tsconfig.app.json
-  tsconfig.json
-  tsconfig.spec.json
-  src

Run `ng build` to compile the Angular application. The compile files will be under `dist/deckofcards` directory

## Serve the Angular Application

Use a web server to serve the compiled Angular application. Here is a list of web server 

- [Nginx](http://nginx.org/en/download.html) 
- [http-server](https://www.npmjs.com/package/http-server)
- [Caddy](https://github.com/caddyserver/caddy)

For example using Caddy to serve 

```
  # Build Angular application
  ng build
  # Serve Angular application on port 3000
  caddy file-server --listen :3000 --root dist/deckofcards
```

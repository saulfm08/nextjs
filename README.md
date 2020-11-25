# Sample nextjs
Sample node.js application using [Next.js](https://nextjs.org/docs)
## System Requirements
- Node.js 14 or later. Install it using:
```
# Using Ubuntu
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
apt-get update
curl -sL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs

# Check the installion
node --version
v14.15.1

npm --version
6.14.9
```
Using another Linux Distribution, [take a look here](https://github.com/nodesource/distributions/blob/master/README.md)
## Get Started
Go to `/home/app` and clone:

``` 
git clone git@github.com:saulfm08/nextjs.git
```

Enter into `code` directory and install dependencies:
```
npm install 
or
npm i
```

To start developing your application run 
```
npm run dev 
```

If its working, you should see something like this:
```
$ npm run dev

> nextjs@1.0.0 dev /home/saul/nodejs_samples/nextjs/code
> next dev

ready - started server on http://localhost:3000
We detected TypeScript in your project and created a tsconfig.json file for you.

event - compiled successfully
```
Type `CTRL+C` to exit (you may do this after you test on your browser)

This starts the development server on http://localhost:3000.

Go to your preferred browser (Google Chrome, Firefox etc) and:

- Visit http://localhost:3000 to view your application (for local environments) or
- Visit http://<dns or url or public ip>:3000 to view your application (for server environments).

## Alternative start
You can also build the application:
```
npm run build
```

And start the application
```
npm start
```

If its working, you should see something like this:
```
$ npm start

> nextjs@1.0.0 start /home/saul/nodejs_samples/nextjs/code
> next start

ready - started server on http://localhost:3000
```

Type `CTRL+C` to exit (you may do this after you test on your browser)
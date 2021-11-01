# Code Server for aws workspace

![Visits Badge](https://badges.pufler.dev/visits/simorgh1/code-server-aws)
[![GitHub license](https://img.shields.io/github/license/simorgh1/code-server-aws)](https://github.com/simorgh1/code-server-aws/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/simorgh1/code-server-aws)](https://github.com/simorgh1/code-server-aws/stargazers)
![Twitter Follow](https://img.shields.io/twitter/follow/bahrammaravandi?style=social)
![LinkedIn Follow](https://shields.io/badge/style-bahram.maravandi-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/bahram.maravandi)

Stargaze ![GitHub Repo stars](https://img.shields.io/github/stars/simorgh1/code-server-aws?style=social) if you find it useful.

Code Server is web based vscode running in a container, this repo was customized for working with aws cloud.

## What is Code Server

Code Server is an open source project by [coder](https://coder.com/about) implementing web based vscode.

## Code Server vs GitHub editor

When browsing a GitHub repository, by entering the **.** key, a web based vscode will open in github.dev. In that editor which based on vscode, you could edit any source file and and commit which in this case means a push. The difference with **Code Server** is that first, not all extensions are allowed in the web editor and second, there is no terminal available yet.

## Code Server vs vscode.dev

If you open [vscode.dev](https://vscode.dev/), you could open a github repository or pull request and start working on it. Similar issues as in the GitHub web editor, not all extensions a re supported and there is no terminal. vscode.dev could be used for example for joining a [liveShare session](https://code.visualstudio.com/learn/collaboration/live-share) in web, which is very useful. Just click on the liveShare link you received and join in vscode.dev or if you are working with local vscode and already installed [liveShare extension](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare), join in your vscode.

## Why Code Server

You could build your own vscode editor using Code Server and host it either local or in any other environment like aws, gcp, azure or on-premises. It supports installing any extension and you have a terminal and could use your preferred dev tools.

This example, adds aws related tools like aws cli, cloudFormation linter and configures the session so that you could start writing CloudFormation templates or work with any other aws resource type.

## Requirements

- Configured aws account
- Docker
- GitHub account as idp

## Getting started

Clone the repo, and configure you aws account, make sure docker already running, then start the local container using:

```bash
code-server-aws/$ ./start.sh
```

It will build custom code server docker image, which has aws cli and cloudformation helper tools, after that it runs the container and mounts the local folder as project folder. Then you could start working on project by opening http://localhost:8080/ folder, password to be find in local .config folder.

If you want to run in a different port, give the new port as arg to start script:

```bash
code-server-aws/$ ./start.sh 8099
```

### Starting with tls

You might also want to start code server with tls. Then use the following command:

```bash
code-server-aws/$ ./start.sh tls
```

This will start Code Server with a random port and https, then it will use GitHub as your identity provider. The project will be available with a custom domain like:

```bash
https://code_server_aws-$YOURGITHUBUSER.cdr.co/
```

Let say you authenticate to your GitHub account with max as GitHub user, then your custom account will be for the repo **code-server-aws**:

```bash
https://code_server_aws-max.cdr.co/
```

And this from anywhere, even from your ipad, I tested with MacBook air m1 and Safari browser, Windows 11 Chrome and Edge browsers.

Hint: It might be, that by opening in Safari, Terminal does not show any thing, then open settings, enter gpu, and set **gpuAcceleration** to off.

After first startup, following recommended extensions could be installed:

- Tasks
- GitLens
- GitHistory
- Prettier
- Code Spell Checker
- Fix Json
- ESLint
- Material Icon Theme
- AWS Toolkit
- Indenticator
- Indent Rainbow
- Markdown Preview
- YAML
- Python

# Feedback

If you have any questions using the Code Server for aws workspace, contact me by my twitter/linkedin provided above.

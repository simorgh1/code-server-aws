# Code Server for AWS Workspace

![Visits Badge](https://badges.pufler.dev/visits/simorgh1/code-server-aws)
[![GitHub license](https://img.shields.io/github/license/simorgh1/code-server-aws)](https://github.com/simorgh1/code-server-aws/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/simorgh1/code-server-aws)](https://github.com/simorgh1/code-server-aws/stargazers)
![Twitter Follow](https://img.shields.io/twitter/follow/bahrammaravandi?style=social)
![LinkedIn Follow](https://shields.io/badge/style-bahram.maravandi-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/bahram.maravandi)

Stargaze ![GitHub Repo stars](https://img.shields.io/github/stars/simorgh1/code-server-aws?style=social) if you find it useful.

Code Server is web based VS Code running in a container, this repo was customised for working with AWS Cloud. 

## What is Code Server

Code Server is an open source project by [Coder](https://coder.com/about) implementing web based VS Code.

## Code Server vs GitHub editor

When browsing a GitHub repository, by entering the . key, a web based VS Code will open in *github.dev*. In that editor which based on VS Code, you could edit any source file and and commit, which in this case is a push. The difference with **Code Server** is that first, not all extensions are installable in the web editor and second, there is no integrated terminal available yet.

## Code Server vs vscode.dev

If you open [vscode.dev](https://vscode.dev/), you could open a GitHub repository or pull request and start working on it. Similar issues as in the GitHub web editor, not all extensions are supported and there is no integrated terminal. 

vscode.dev could be used for example for joining a [LiveShare session](https://code.visualstudio.com/learn/collaboration/live-share) in web, which is very useful. Just click on the LiveShare link you received and join in vscode.dev or if you are working with local VS Code and already installed [LiveShare extension](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare), join in your local VS Code session.

## Why Code Server

You could build your own VS Code editor using Code Server and host it either local or in any other environment like AWS, GCP, Azure or on-premises. It supports installing any extension and you have an integrated terminal and could use your preferred dev tools.

This example, adds AWS related tools like AWS Cli, CloudFormation linter and configures the session so that you could start writing CloudFormation templates or work with any other AWS resource type.

## Requirements

- Configured AWS account
- Docker
- GitHub account as IDP

## Getting started

Clone this repository, and configure your AWS account, then make sure Docker is running, then start Code Server using:

```bash
code-server-aws/$ ./start.sh
```

It will build custom Code Server Docker image, which has AWS Cli and CloudFormation helper tools, after that it runs the container and mounts the local repository folder as project folder. Then you could start working on the project by opening “http://localhost:8080/“ page, password is stored in local “~/.config” folder.

If you want to run the server with a different port, give the new port as an arg to the start script:

```bash
code-server-aws/$ ./start.sh 8099
```

### Starting with TLS

You might also want to start Code Server with TLS (Transport Layer Security). Then use the following command:

```bash
code-server-aws/$ ./start.sh tls
```

This will start Code Server with a random port and https, then it will use GitHub as your Identity Provider. The project will be available with a custom domain like "https://code_server_aws-$YOURGITHUBUSER.cdr.co/".

Let say you authenticated to your GitHub account with "max" as GitHub user, then your custom domain for the repository **code-server-aws** will be ""https://code_server_aws-max.cdr.co/.

And use it from anywhere, even from your iPad, I've tested with MacBook air m1 and Safari browser, Windows 11 Chrome and Edge browsers.

Hint: It might be, that by opening the page in Safari, the integrated terminal does not show any thing, then open settings, enter "gpu", and set **gpuAcceleration** to off.

After first startup, following extensions are recommended to be installed:

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

If you have any questions using Code Server for AWS Workspace, contact me by my twitter/linkedin provided above.

dnl -*- html -*-
define(__timestamp, 2020-05-25)dnl
define(__title, `Github CI')dnl
define(__subtitle, `a dive into private keys, private repos, and continuous integration')dnl
define(__keywords, `github, ssh, CI')dnl
define(__id, 5)dnl
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4
I recently spent almost an entire day battling a broken Github Actions CI pipeline because of a new, private dependency. Here is that story.

## The Setup: Basic Continuous Integration

Scenario: you have a dandy little repo for a website that you're cooking up, and you have some Github Actions doing some CI on push and on pull requests. The actions are:

1. running your linter (because you are fastidious enough to recognize the value in picking lint but you are also refined enough to not stoop to picking lint yourself), and

2. running your project on a variety of versions of node, across a variety of operating systems. This is called a *build matrix* and it ensures that your code is resilient enough to run under lots of different conditions

## The Wrinkle: Private Dependencies

Now your code has a new dependency. A library from a 3rd party vendor, hosted in a private repo on GitHub.

You have access to the private repo yourself, and can download and use the library just fine. The wrinkle is that your CI tools are not real "people" and they don't have "GitHub accounts" so you can't add them to the private "repository" so they can't download and install the dependency, and so they can't complete the build, and so now your entire pipeline is broken.

## Controlled Access To The Private Repo

The first thing you want to do is figure out a way to grant controlled access to this private repo.

Luckily for us, the private repo belonged to our organization (*the 3rd party vendor was ME, Barry!*) so I had access to the repo's settings and could figure this part out myself instead of having to coordinate with an actual 3rd party.

What ended up being the solution here was [deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys).

This involves creating a new set of public/private SSH keys. This was intimidating to me because I don't know a whole ton about SSH keys. One misconception I had was that they keys would somehow intrinsically have some kind of identifying information about me attached to them, and I didn't want my personal keys associated with this repo or, more importantly, my own privacy some how put at risk.

But that was, as I said, a misconception. There's nothing inherently identifying about the keys. They don't really identify an *individual* at all. They simply perform a sort of lock and unlock function with each other.

Anyway, here's what I did:

1. Make a [brand new key](https://youtu.be/lKcpodt0YCU):

    1. `ssh-keygen -t rsa -b 4096 -C <some comment>` I don't know if the -C flag is required. I just put in, as an identifying remark, the name of the website repo that will be using the key.

    2. Enter a filename. I again used the name of the web repo.

    3. No passphrase.

4. Go to *Deploy Keys* in Settings in the private repo and add a new deploy key. Paste in the *public key*. Keep *Allow Write* unchecked: we just want read access.

Now anybody with the private key should be able to pull down the private repo.

To test it, you can preface any git command with an instruction to use a specific ssh key like this: `GIT_SSH_COMMAND="ssh -i path/to/ssh_key" <some command>`

You can, in that fashion, go to a local copy of the private repo and try to `git pull`. Or you can go to your website repo and try to `npm i`.

## Github Actions

The next steps required a better understanding of Github Actions than I had at the time.

Here's the flow as I now understand it: the uppercase "Actions" for a repo consists of one or more workflows, made up of one or more "jobs", which are made up of steps, which can use lowercase "actions".

In slightly more depth:

1. **workflows**: defined by `.github/workflows/name.yml`. You can edit them pretty effectively (with helpful autocompletion!) right in the browser. (I feel like workflows used to have some kind of a graphical editor on the site, but it's definitely not there now. I could be mistaken.)

    I'm not entirely sure why you would have more than one workflow.

2. **jobs**: the parts of the workflow. These can be "lint" and "build", e.g., as they are in my website repo. You can also run tests as a job. It's possible to share artifacts between jobs, which is one reason to group or divide jobs: if they don't need to share any kind of state or information, maybe they should be separate workflows.

    They run on a vm such as "ubuntu-latest". I don't know anything else about this mysterious vm.

3. **steps**: Things to run as part of a job. They can consist of individual lines of bash script via the `run:` key name, or they can be more complex *actions* defined by the `uses:` key name.

4. **actions**: for a more complicated step, you can run an *action* with the `use: <path/to/action>` syntax in your yml file. The path can be a "name/repo" kind of path to an action hosted on github (there are a lot of prebuilt "actions/name" actions provided by github), or it can be a relative path to an action.yml file in your own repo. e.g. `./.github/actions/myaction/action.yml`.

    action.yml contains instructions for executing a js file or a Dockerfile, defines inputs (env variables or command arguments) and outputs, and some other stuff.


I made a sort of actions Hello World / playground at [chrisman/actions](https://github.com/chrisman/actions/). Feel free to take a gander.

## Getting the Keys into the CI

To fix the build step of our workflow, this ultimately ended up being a simple two step process:

1. Add a new secret to the website repo, and adding the private key to it.

2. Adding a `use: webfactory/ssh-agent` step to the build job. ([webfactory/ssh-agent](https://github.com/webfactory/ssh-agent))

Of the two ssh-key actions I tried, both claimed that the secret must be in PEM format. At the same time, GitHub insisted that the Deploy Key must be in openssl format. Although you can easily convert between the formats, they cannot used with each other for some reason. This was a headache.

Of the two, only webfactory/ssh-agent seemed to *say* it requires PEM, but only in a wink-wink kind of way, while actually also allowing openssl while pretending to look the other way.

For the sake of completeness, the other action I tried was [shimataro/ssh-key-action](https://github.com/shimataro/ssh-key-action). Great action. Just didn't work for what I needed it for.

## Getting the keys into the linter

I never succeeded at this.

Well. I secceeded at this. But it didn't fix what was ultimately broken about this step.

We were using [MarvinJWendt/run-node-formatter](https://github.com/MarvinJWendt/run-node-formatter) for linting, which was awesome and annoying.

It's deal was this: it would checkout the branch on push, authorize itself to the repo with a github oauth env token, and run the linter. If there were any corrections, it would push the changes itself to the branch.

This was great because it meant you never had to slow down even an infintesimal amount of time to run the linter yourself locally: the CI would lint and commit for you!

But it was annoying because if you ever didn't lint, the lint + commit would happen remotely, so your local would immediately be out of sync, and you'd have to pull and merge before continuing to make changes.

I found this to be worse because:

1. It take longer to have changes rejected and to pull new changes than it does to just run the linter, and
2. It creates an ugly merge commit

Anyway, I tried a couple things:

1. Adding a `use: webfactory/ssh-agent` like with the build steps. This did not work.

2. Copying the action to `.github/actions/formatter/action.yml`. Updating the Dockerfile to build with openssl. Seting "secretkey" and "knownhosts" secrets on the repo. Modifying action.yml to set them to env variables. Changing entrypoint.sh to create `.ssh/id_rsa` and `.ssh/known_hosts` and start the ssh-agent and add the key to the agent.

This did everything I wanted it to! I could `ssh-keygen -lf id_rsa` (in entrypoint.sh) to check the fingerprint and compare it to the one I have locally.

But it still failed at installing the private repo with an npm "No user exists for UID" error.

What I could learn from my research, thanks to brave Jenkins users who forged the path of CI ahead of us, is that I could get around this by setting a UID / GID on the Docker container, but this Alpine image is--I think--already running on the Ubuntu vm defined by the workflow.yml, and I don't know--nor do I care to know--how to pass that kind of information through that many (count 'em: two!) layers of abstraction.

## Linting Locally

So I deleted the linter action and added a pre-commit hook to lint locally.

It's fine. It's actually better than fine: it's great!

The vue CLI provides githooks out of the box via [yorkie](https://github.com/yyx990803/yorkie) (a fork of the perennial [husky](https://github.com/typicode/husky)).

A quick `npm i -D lint-staged`, and a short addition to my package.json:

```
"gitHooks": {
  "pre-commit": "lint-staged"
},
"lint-staged": {
  "*.{js,vue}": "vue-cli-service lint"
},
```

... and I was good to go! Linting the entire project takes an agonizing number of seconds. Like, maybe up to 2! Linting merely the staged files takes next to no time. Bonus: no more upstream commits getting your local branch out of sync.


## Resources

### Glossary

Lint
:   A bit of fluff you pick off a piece of clothing. The stuff you remove from the lint trap of a clothes dryer. An ort, a scrap, an iota. A trifling not work concerning yourself with. Hardly worth your effort to worry about. Best to offload responsibility for such a menial triviality to some kind of automated code scanner. 

changequote`'dnl change quotes `back to default'
include(src/footer.html)

Repository contains all example and notes to practice GitHub actions

## 01 - fail / success workflows

### Theory:

- by default if a step fail all other steps will not execute
- default status for success is zero. Any other value is fail
- jobs will run - by default jobs run in parallel so is not impacted by another job step failure

#### 1 fail

Exercise: add step for fail

#### 2 succeed

Exercise: change step to pass - exit 0

## 02 - Workflow events

### Theory:

Events = Triggers
Triggers types:

1. Repository events
   - push
   - issues
   - pull_request
   - pull_request_review
   - fork, etc
2. Manual trigger
   - trigger from UI
   - trigger via API call
   - trigger from within other workflow
3. Schedule - CRON expression
   - [Useful generator](chrontab.cronhub.io)

#### 1 Access context ${{}}

Context is a way to access info about workflow runs, variables, runner environment and jobs

Expression syntax: ${{ context }}

Context types:
[Official documentation](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs#github-context)

## 03 - Workflow runners

### Theory:

Runners are virtual servers the execute jobs from workflows

Runner types:

1. GitHub-hosted
2. Self-hosted

$\color{green}{Remark:}$
To see what is virtual machine set-up on GitHub-hosted got to Actions tab -> Workflow -> Set up job -> Expand Runner Image -> follow the link Included Software

#### Access Environment variables

GitHub has multiple environment variables that can be accessed with $VAR_NAME
environment vars are uppercase only

$\color{green}{Remark:}$
On windows environment variable are not accessible because of syntax. The shell property must be specified in order to print the value. Still is accessible using env context

![Access env var using dollar sign](<Images/Screenshot 2025-03-20 074328.jpg>)

## 04 - Third party actions

Actions:

1. sell script commands -> run: property -> this runs shell commands
2. Actions -> uses: property -> this are actions that can be used
   Advantages:

- shell commands or other commands are encapsulated in action and is not need to repeat them
- we can create our own custom commands

## 06 - Using context

GitHub provides context that have multiple info that can be used in workflow

$\color{green}{Remark:}$
To use context at the workflow level, for example input context, first must be defined for use it. Example form workflow shows how name of the workflow can be customized at runtime.

Important contexts:

- github
- input
- env

#### Environment variables

We can define environment variables using env context

## 07 Expressions and variables

Expressions are used to conditionally run steps or commands in workflow.
Syntax: ${{ expression}}

$\color{green}{Remark:}$
${{}} is optional in expressions

# status badge example

![example workflow](https://github.com/carmenlup/gh-actions-practice/actions/workflows/artifacts-learning.yml/badge.svg)

![example workflow](https://github.com/carmenlup/gh-actions-practice/actions/workflows/update-readme.yaml/badge.svg)

## 08 Environment variables

Are used to ser and reuse non-sensitive configuration info
Way to define

1. Single workflow

   Can be defined at the next levels in order of their precedence:

   - workflow
   - job
   - steps

2. Multiple workflows

   Can be defined at the next levels in order of their precedence:

   - Organization
   - Repository
   - Environment

#### Env variables can be access using

- $
- env context

#### Env variable name constraints

Can contain char [a-z], [A-Z], [0-9] and \_

- not start with GITHUB\_ prefix
- not start with a number
- no space
- are case sensitive
- must be unique to the repo, organization or enterprise where they are defined

#### Other constraints

- size: 48 KB
- number
  - 1000 - organization
  - 500 - repository
  - 100 - environment
- size per workflow: 256 KB

$\color{green}{Remark:}$
If constraints exceed only vars below limit are accessible in alphabetical order

$\color{green}{Remark on variables:}$
Default environment variables are defined by GitHub and are accessible via github context (not env context)

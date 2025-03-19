# staus badge example
![example workflow](https://github.com/carmenlup/gh-actions-practice/actions/workflows/artifacts-learning.yml/badge.svg)

![example workflow](https://github.com/carmenlup/gh-actions-practice/actions/workflows/update-readme.yaml/badge.svg)

Repository contains all example and notes to practice github actions

## 01 - fail / success workflows

### Theory:

- by default if a step fail all other steps will not execute
- default status for success is zero. Any other value is fail
- jobs will run - by defaut jobs run in paralel so is not impacted by anothor joob step failure

#### 1 fail

Exercice: add step for fail

#### 2 succeed

Exercice: change step to pass - exit 0

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
3. Schedule - CRON espression
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
   Remark: To see what is virtual machine set-up on GitHub-hosted got to Actions tab -> Workflow -> Set up job -> Expand Runner Image -> follow the link Included Software

#### Access Environment variables

GitHub has multiple environment variables that can be accessed with $VAR_NAME
environment vars are uppercase only
Remark: On windows environment variable are not accesble because of sintax. The shell property must be specified in order to print the value.

## 04 - Third party actions

Actions:

1. sell script commands -> run: property -> thiss runs shell commands
2. Actions -> uses: property -> this are actions that can be used
   Advantages:

- shell cocmmands or other commands are enccapsulated in action and is not need to repete them
- we can create our own custom comands

## 06 - Using context

GitHub provides context that have multiple info that can be used in workflow
Remark: to use context at the workflow level, for example input context, first must be defined for use it. Example form workflow shows how name of the workflow can be customised at runtime.

important contexts:

- github
- input
- env

#### Environment variables

We can define environment variables using env context

## 07 Expressions and variables

Espressins are used to conditionaly run steps or commands in workflow.
Syntax: ${{ expression}}
Remark: ${{}} is optional in expressions

[![Status Badge](https://img.shields.io/badge/status-badge-new)](https://github.com/carmenlup/gh-actions-practice/actions/workflows/update-badge.yml/dispatches)

Update
Updated badge status

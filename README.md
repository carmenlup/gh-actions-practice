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

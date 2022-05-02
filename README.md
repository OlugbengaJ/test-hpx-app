# hpx

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Running locally
1. Clone repository

2. Run `flutter pub get` to download all needed packages. The command will work for a system that has already been setup with flutter. 

3. Run `flutter run`, this will run the flutter application on any available device or `flutter run -d <device>`, <device> here is for any device you want to specifically run the flutter application on.


## Creating local branch from Remote main branch

1. git pull origin main

2. git checkout -b **new-branch-name** E.g:  git checkout -b  `layers` where `layers` is Azure ticket/feature name

3. Commit changes to local branch

4. git push --set-upstream origin `layers` to push your local changes to the remote branch

## Creating PR 

Once you have completed your changes and your work is ready for review, you can create a  `PR` for your code to be peer reviewed.

- Request 2+ reviewers for each PR.

- Ensure all unit and integration tests passes and CI/CD pipeline does not fail.

    **Guideline**

    **Name:** `[layers] : Worked on user interface to show added layers`

    ### PR Content Format

    **Goal:**

    **What & why:**

    **Notes for reviewers:**

    **Screenshots:**
  
  ## Merging PR

- Reviewers should leave merging to the branch author, except when a merge is urgently needed.

- Rebase the main branch into your own branch and ensure there are no conflicts before merging. 

- Merge PRs via 'Squash and Merge' option in github. All other options should be disabled.

- One/Two PR approval is required before merging to main on shared repos.

- Delete a branch when you are done with it and only if there is the need
  
#Code Style

## Classes definition
- ClassName (not class_name, not className, etc)
## Non-const variables definition
- variableName (not variable_name, not Variable_name etc)
## Const variables definition
- variable_name

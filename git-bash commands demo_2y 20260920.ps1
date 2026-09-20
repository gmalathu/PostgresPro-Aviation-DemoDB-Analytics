
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~
$ git --version
git version 2.55.0.windows.5

$ git config --global user.name "Your Name"
$ git config --global user.email "your.email@example.com"

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~
$ cd git-practice

#Change directory to airline data analytics project folder
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~
$ cd Documents/AnalyticsProjects/pg_demo_airline_1y_booking

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/Documents/AnalyticsProjects/pg_demo_airline_1y_booking (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   demo_airline_sql.sql
        modified:   pg airline 1y data workpapers.xlsx

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Airline Data Analytics - Gemini.gdoc
        ERD diagram postgres demo bookings.png
        git-bash commands demo_2y 20260920.ps1

no changes added to commit (use "git add" and/or "git commit -a")

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/Documents/AnalyticsProjects/pg_demo_airline_1y_booking (main)
$ git add demo_airline_sql.sql

#check the state of your project
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

#Create a file to apply versioning to > 'README.md'
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ echo "# My First Git Project" > README.md

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)

#Move README.md from untracked to staging w/ 'git add'
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md

#Commit to repo with clear message describing the change
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git commit -m "Initial commit: ADD README file"
[master (root-commit) 34362a5] Initial commit: ADD README file
 1 file changed, 1 insertion(+)
 create mode 100644 README.md

#Write output (New Line) to README.md (Make a change)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ echo "Learning Phase 1 of Git" > README.md

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")

#Move changes made to README.md to staging w/ 'git add'
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

#Commit change to README.md in git
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git commit -m "Update README with learning goals"
[master da2f7e5] Update README with learning goals
 1 file changed, 1 insertion(+), 1 deletion(-)

#Review projects' historical timeline (2 commits w/ hash IDs)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ git log --oneline
da2f7e5 (HEAD -> master) Update README with learning goals
34362a5 Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ cat README.md
Learning Phase 1 of Git

#Phase 2: Connecting to GitHub & Branching
#Ignore these lines in PS buffer (need to update path)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (master)
$ ggit remote add origin https://github.com/YOUR-USERNAME/git-practice.git
git branch -M main
git push -u origin main
bash: $'\302\226git': command not found
fatal: 'origin' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git remote add origin https://github.com/YOUR-USERNAME/git-practice.git
git branch -M main
git push -u origin main
info: please complete authentication in your browser...


Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git remote add origin https:///github.com/gmalathu/git-practice.git
error: remote origin already exists.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git remote remove origin

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git remote -v

#Resume Phase 2 from here.

<#
Log into GitHub and click New Repository (top right + icon).

Name it git-practice, leave it Public, and do NOT check "Add a README file" (you already have one locally). Click Create repository.

Copy the commands under "or push an existing repository from the command line". They look like this:

Commands:
git remote add origin https://github.com/YOUR-USERNAME/git-practice.git
git branch -M main
git push -u origin main

What happened? origin is now the shortcut name for your GitHub repository URL, and your local main branch is pushed live to GitHub.
#>

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git remote add origin https:///github.com/gmalathu/git-practice.git

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git branch -M main

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git push -u origin main
info: please complete authentication in your browser...
warning: redirecting to https://github.com/gmalathu/git-practice.git/
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (6/6), 510 bytes | 510.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https:///github.com/gmalathu/git-practice.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.

#Instead of editing main directly, create a branch named feature/about-page:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b feature/about-page
Switched to a new branch 'feature/about-page'

#Verify which branch you are on:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git branch
* feature/about-page
  main

#Create a new file on this feature branch (ERROR)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ echo "This project is built to master Git." about.txt
This project is built to master Git. about.txt

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git add about.txt
fatal: pathspec 'about.txt' did not match any files

#Create a new file on this feature branch
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ echo "This project is built to master Git." > about.txt

#Stage and commit the new file:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git add about.txt
warning: in the working copy of 'about.txt', LF will be replaced by CRLF the next time Git touches it

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git commit -m "Add about.txt page"
[feature/about-page 7d7046f] Add about.txt page
 1 file changed, 1 insertion(+)
 create mode 100644 about.txt

#Send your new branch up to GitHub so others (or you) can review it
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git push -u origin feature/about-page
warning: redirecting to https://github.com/gmalathu/git-practice.git/
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 319 bytes | 319.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
remote:
remote: Create a pull request for 'feature/about-page' on GitHub by visiting:
remote:      https://github.com/gmalathu/git-practice/pull/new/feature/about-page
remote:
To https:///github.com/gmalathu/git-practice.git
 * [new branch]      feature/about-page -> feature/about-page
branch 'feature/about-page' set up to track 'origin/feature/about-page'.

<#
Create and Merge a Pull Request (PR) (Merge your changes into the main codebase.)

1	Go to your repository page on GitHub.com.
2	You will see a yellow banner: "feature/about-page had recent pushes". Click Compare & pull request.
3	Write a brief title/description and click Create pull request.
4	Click Merge pull request, then Confirm merge.
5	Switch back to your local terminal and bring those merged changes back to your local main:
#>

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/about-page)
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git pull origin main
warning: redirecting to https://github.com/gmalathu/git-practice.git/
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (1/1), 911 bytes | 911.00 KiB/s, done.
From https:///github.com/gmalathu/git-practice
 * branch            main       -> FETCH_HEAD
   da2f7e5..c342438  main       -> origin/main
Updating da2f7e5..c342438
Fast-forward
 about.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 about.txt

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git log --oneline
c342438 (HEAD -> main, origin/main) Merge pull request #1 from gmalathu/feature/about-page
7d7046f (origin/feature/about-page, feature/about-page) Add about.txt page
da2f7e5 Update README with learning goals
34362a5 Initial commit: ADD README file

<#
Phase 3 focuses on collaboration and handling merge conflicts.

Key Concepts
Fetch vs. Pull: git fetch checks the remote repository for updates without changing your local files. git pull fetches and merges those remote updates automatically.

Merge Conflict: Git's way of saying: "Two people changed the same line of code. I won't guess which one is right."

Conflict Markers: Special text (<<<<<<<, =======, >>>>>>>) Git inserts directly into your file to highlight conflicting changes.

#>

#Switch to your main branch and pull the latest changes from GitHub:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout main
Already on 'main'
Your branch is up to date with 'origin/main'.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git pull origin main
warning: redirecting to https://github.com/gmalathu/git-practice.git/
From https:///github.com/gmalathu/git-practice
 * branch            main       -> FETCH_HEAD
Already up to date.

#Create Branch A and Modify README
#Create a branch to represent the first set of changes:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b branch-alice
Switched to a new branch 'branch-alice'

#Change line 2 of README.md to say "Alice's version of line 2", then commit:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-alice)
$ echo "Alice's version of line 2" >> README.md

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-alice)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-alice)
$ git commit -m "Alice updates line 2"
[branch-alice 2403fde] Alice updates line 2
 1 file changed, 1 insertion(+)

#Switch back to main without merging Alice yet:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-alice)
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

#Create Branch B and Modify the Same Line
#Create a second branch off of main:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b branch-bob
Switched to a new branch 'branch-bob'

#Change line 2 of README.md to say "Bob's version of line 2", then commit:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-bob)
$ echo "Bob's version of line 2" >> README.md

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-bob)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-bob)
$ git commit -m "Bob updates line 2"
[branch-bob f0213ca] Bob updates line 2
 1 file changed, 1 insertion(+)

#Switch back to main:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (branch-bob)
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

<#
Merge Alice's Branch into Main

Merge Alice's branch first. Since main hasn't changed, this will merge cleanly without conflicts:
#>
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git merge branch-alice
Updating c342438..2403fde
Fast-forward
 README.md | 1 +
 1 file changed, 1 insertion(+)

#Attempt to Merge Bob's Branch (Now try merging Bob's branch into main:)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git merge branch-bob
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.

#Run git status to see README.md flagged under Unmerged paths.
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main|MERGING)
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")

<#
Resolve the Merge Conflict

Open README.md in your text editor (VS Code, Nano, or text editor). You will see Git's conflict markers:

<<<<<<< HEAD: What is currently on your active branch (main).
=======: The boundary line between the two versions.
>>>>>>> branch-bob: What is coming from the branch being merged.

To fix it: Delete the marker lines (<<<<<<<, =======, >>>>>>>) and edit the file to look exactly how you want final version to be (e.g., combining both or choosing one):

Save the file.
#>

#Stage and Complete the Merge Commit (Tell Git the conflict is resolved by staging the file:)
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main|MERGING)
$ git add README.md

#Finalize the merge:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main|MERGING)
$ git commit -m "Resolve merge conflict between Alice and Bob"
[main 8cf483c] Resolve merge conflict between Alice and Bob

#Check git log --oneline to view the resolved history, then sync to GitHub:
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git log --oneline
8cf483c (HEAD -> main) Resolve merge conflict between Alice and Bob
f0213ca (branch-bob) Bob updates line 2
2403fde (branch-alice) Alice updates line 2
c342438 (origin/main) Merge pull request #1 from gmalathu/feature/about-page
7d7046f (origin/feature/about-page, feature/about-page) Add about.txt page
da2f7e5 Update README with learning goals
34362a5 Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git push origin main
warning: redirecting to https://github.com/gmalathu/git-practice.git/
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 12 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 938 bytes | 938.00 KiB/s, done.
Total 9 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), done.
To https:///github.com/gmalathu/git-practice.git
   c342438..8cf483c  main -> main

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b feature/rebase-demo
Switched to a new branch 'feature/rebase-demo'

<#
Phase 4 covers the power tools that separate intermediate users from Git experts: Interactive Rebase (cleaning history), Cherry-Pick (cherry-picking specific commits), and Reflog (disaster recovery time-machine).

Key Concepts
Interactive Rebase (git rebase -i): Lets you rewrite history—combine (squash), edit, reorder, or drop past commits before pushing to a shared repository.

Cherry-Pick (git cherry-pick): Applies a single commit from one branch directly onto another branch without merging the whole branch.

Reflog (git reflog): Git's safety net log. It records every action where HEAD moved, allowing you to recover deleted branches or commits even after git reset --hard.

1.Exercise 1: Interactive Rebase (Squash Commits):Combine messy commits into a clean snapshot.Engineers often make tiny, messy commits locally (e.g., "wip", "fix typo") before submitting a Pull Request. Interactive rebase cleans this up.Create a sandbox branch and make 3 small commits:

#>

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ echo "Feature draft 1" > feature.txt && git add feature.txt && git commit -m "WIP: draft 1"
echo "Feature draft 2" >> feature.txt && git add feature.txt && git commit -m "WIP: draft 2"
echo "Feature final" >> feature.txt && git add feature.txt && git commit -m "Add finished feature"
warning: in the working copy of 'feature.txt', LF will be replaced by CRLF the next time Git touches it
[feature/rebase-demo 894f94a] WIP: draft 1
 1 file changed, 1 insertion(+)
 create mode 100644 feature.txt
warning: in the working copy of 'feature.txt', LF will be replaced by CRLF the next time Git touches it
[feature/rebase-demo 5417936] WIP: draft 2
 1 file changed, 1 insertion(+)
warning: in the working copy of 'feature.txt', LF will be replaced by CRLF the next time Git touches it
[feature/rebase-demo 9e84d91] Add finished feature
 1 file changed, 1 insertion(+)

#Now, combine (squash) these 3 commits into 1 single, clean commit:
#Your text editor will open listing the 3 commits:

<#
pick a1b2c3d WIP: draft 1
pick e4f5g6h WIP: draft 2
pick i7j8k9l Add finished feature

Change pick to squash (or s) for the bottom two commits:

pick a1b2c3d WIP: draft 1
squash e4f5g6h WIP: draft 2
squash i7j8k9l Add finished feature

Save and close the editor. A second prompt will open asking for a new commit message. Change it to Add finished feature and save.

Check git log --oneline—the 3 messy commits are now 1 clean commit!
#>
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ git rebase -i HEAD~3
Successfully rebased and updated refs/heads/feature/rebase-demo.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ git rebase -i HEAD~3
[detached HEAD 68cdcf7] WIP: draft 1
 Date: Thu Aug 27 12:15:28 2026 -0500
 1 file changed, 3 insertions(+)
 create mode 100644 feature.txt
Successfully rebased and updated refs/heads/feature/rebase-demo.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ git log --oneline
68cdcf7 (HEAD -> feature/rebase-demo) WIP: draft 1
8cf483c (origin/main, main) Resolve merge conflict between Alice and Bob
f0213ca (branch-bob) Bob updates line 2
2403fde (branch-alice) Alice updates line 2
c342438 Merge pull request #1 from gmalathu/feature/about-page
7d7046f (origin/feature/about-page, feature/about-page) Add about.txt page
da2f7e5 Update README with learning goals
34362a5 Initial commit: ADD README file

<#
Exercise 2: Cherry-Pick a Single Commit:
Apply a specific fix from another branch.

Imagine someone fixed a critical bug on a feature branch, and you need only that bug fix on main right now without pulling in their uncompleted work.

Create a branch with a bug fix commit:
#>

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ git checkout -b feature/bugfix-demo
Switched to a new branch 'feature/bugfix-demo'

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/bugfix-demo)
$ echo "bug fix code" > bugfix.txt

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/bugfix-demo)
$ git add bugfix.txt
warning: in the working copy of 'bugfix.txt', LF will be replaced by CRLF the next time Git touches it

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/bugfix-demo)
$ git commit -m "Fix critical security bug"
[feature/bugfix-demo 96869a7] Fix critical security bug
 1 file changed, 1 insertion(+)
 create mode 100644 bugfix.txt

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/bugfix-demo)
$ git log --oneline
96869a7 (HEAD -> feature/bugfix-demo) Fix critical security bug
68cdcf7 (feature/rebase-demo) WIP: draft 1
8cf483c (origin/main, main) Resolve merge conflict between Alice and Bob
f0213ca (branch-bob) Bob updates line 2
2403fde (branch-alice) Alice updates line 2
c342438 Merge pull request #1 from gmalathu/feature/about-page
7d7046f (origin/feature/about-page, feature/about-page) Add about.txt page
da2f7e5 Update README with learning goals
34362a5 Initial commit: ADD README file

<#
Get the commit hash of this fix by checking git log --oneline (e.g., c8d9e0f).

Switch back to main and apply only that single commit:
#>
Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/bugfix-demo)
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git cherry-pick ^C

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git cherry-pick 96869a7
[main e651b73] Fix critical security bug
 Date: Thu Aug 27 12:25:53 2026 -0500
 1 file changed, 1 insertion(+)
 create mode 100644 bugfix.txt

<#
Exercise 3: Reflog (Disaster Recovery):
Recover a completely deleted branch.

git reflog is your ultimate safety net. Even if you accidentally delete a branch or hard-reset your code, Git rarely deletes anything immediately.

Force-delete your feature/rebase-demo branch:
#>

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git branch -D feature/rebase-demo
Deleted branch feature/rebase-demo (was 68cdcf7).

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git reflog
e651b73 (HEAD -> main) HEAD@{0}: cherry-pick: Fix critical security bug
8cf483c (origin/main) HEAD@{1}: checkout: moving from feature/bugfix-demo to main
96869a7 (feature/bugfix-demo) HEAD@{2}: commit: Fix critical security bug
68cdcf7 HEAD@{3}: checkout: moving from feature/rebase-demo to feature/bugfix-demo
68cdcf7 HEAD@{4}: rebase (finish): returning to refs/heads/feature/rebase-demo
68cdcf7 HEAD@{5}: rebase (squash): WIP: draft 1
0975196 HEAD@{6}: rebase (squash): # This is a combination of 2 commits.
894f94a HEAD@{7}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{8}: rebase (finish): returning to refs/heads/feature/rebase-demo
9e84d91 HEAD@{9}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{10}: commit: Add finished feature
5417936 HEAD@{11}: commit: WIP: draft 2
894f94a HEAD@{12}: commit: WIP: draft 1
8cf483c (origin/main) HEAD@{13}: checkout: moving from main to feature/rebase-demo
8cf483c (origin/main) HEAD@{14}: commit (merge): Resolve merge conflict between Alice and Bob
2403fde (branch-alice) HEAD@{15}: merge branch-alice: Fast-forward
c342438 HEAD@{16}: checkout: moving from branch-bob to main
f0213ca (branch-bob) HEAD@{17}: commit: Bob updates line 2
c342438 HEAD@{18}: checkout: moving from main to branch-bob
c342438 HEAD@{19}: checkout: moving from branch-alice to main
2403fde (branch-alice) HEAD@{20}: commit: Alice updates line 2
c342438 HEAD@{21}: checkout: moving from main to branch-alice
c342438 HEAD@{22}: checkout: moving from main to main
c342438 HEAD@{23}: pull origin main: Fast-forward
da2f7e5 HEAD@{24}: checkout: moving from feature/about-page to main
7d7046f (origin/feature/about-page, feature/about-page) HEAD@{25}: commit: Add about.txt page
da2f7e5 HEAD@{26}: checkout: moving from main to feature/about-page
da2f7e5 HEAD@{27}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{29}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{31}: Branch: renamed refs/heads/master to refs/heads/main
da2f7e5 HEAD@{33}: commit: Update README with learning goals
34362a5 HEAD@{34}: commit (initial): Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout feature/rebase-demo
error: pathspec 'feature/rebase-demo' did not match any file(s) known to git

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git reflog
e651b73 (HEAD -> main) HEAD@{0}: cherry-pick: Fix critical security bug
8cf483c (origin/main) HEAD@{1}: checkout: moving from feature/bugfix-demo to main
96869a7 (feature/bugfix-demo) HEAD@{2}: commit: Fix critical security bug
68cdcf7 HEAD@{3}: checkout: moving from feature/rebase-demo to feature/bugfix-demo
68cdcf7 HEAD@{4}: rebase (finish): returning to refs/heads/feature/rebase-demo
68cdcf7 HEAD@{5}: rebase (squash): WIP: draft 1
0975196 HEAD@{6}: rebase (squash): # This is a combination of 2 commits.
894f94a HEAD@{7}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{8}: rebase (finish): returning to refs/heads/feature/rebase-demo
9e84d91 HEAD@{9}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{10}: commit: Add finished feature
5417936 HEAD@{11}: commit: WIP: draft 2
894f94a HEAD@{12}: commit: WIP: draft 1
8cf483c (origin/main) HEAD@{13}: checkout: moving from main to feature/rebase-demo
8cf483c (origin/main) HEAD@{14}: commit (merge): Resolve merge conflict between Alice and Bob
2403fde (branch-alice) HEAD@{15}: merge branch-alice: Fast-forward
c342438 HEAD@{16}: checkout: moving from branch-bob to main
f0213ca (branch-bob) HEAD@{17}: commit: Bob updates line 2
c342438 HEAD@{18}: checkout: moving from main to branch-bob
c342438 HEAD@{19}: checkout: moving from branch-alice to main
2403fde (branch-alice) HEAD@{20}: commit: Alice updates line 2
c342438 HEAD@{21}: checkout: moving from main to branch-alice
c342438 HEAD@{22}: checkout: moving from main to main
c342438 HEAD@{23}: pull origin main: Fast-forward
da2f7e5 HEAD@{24}: checkout: moving from feature/about-page to main
7d7046f (origin/feature/about-page, feature/about-page) HEAD@{25}: commit: Add about.txt page
da2f7e5 HEAD@{26}: checkout: moving from main to feature/about-page
da2f7e5 HEAD@{27}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{29}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{31}: Branch: renamed refs/heads/master to refs/heads/main
da2f7e5 HEAD@{33}: commit: Update README with learning goals
34362a5 HEAD@{34}: commit (initial): Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git branch -D feature/rebase-demo
error: branch 'feature/rebase-demo' not found

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git reflog
e651b73 (HEAD -> main) HEAD@{0}: cherry-pick: Fix critical security bug
8cf483c (origin/main) HEAD@{1}: checkout: moving from feature/bugfix-demo to main
96869a7 (feature/bugfix-demo) HEAD@{2}: commit: Fix critical security bug
68cdcf7 HEAD@{3}: checkout: moving from feature/rebase-demo to feature/bugfix-demo
68cdcf7 HEAD@{4}: rebase (finish): returning to refs/heads/feature/rebase-demo
68cdcf7 HEAD@{5}: rebase (squash): WIP: draft 1
0975196 HEAD@{6}: rebase (squash): # This is a combination of 2 commits.
894f94a HEAD@{7}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{8}: rebase (finish): returning to refs/heads/feature/rebase-demo
9e84d91 HEAD@{9}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{10}: commit: Add finished feature
5417936 HEAD@{11}: commit: WIP: draft 2
894f94a HEAD@{12}: commit: WIP: draft 1
8cf483c (origin/main) HEAD@{13}: checkout: moving from main to feature/rebase-demo
8cf483c (origin/main) HEAD@{14}: commit (merge): Resolve merge conflict between Alice and Bob
2403fde (branch-alice) HEAD@{15}: merge branch-alice: Fast-forward
c342438 HEAD@{16}: checkout: moving from branch-bob to main
f0213ca (branch-bob) HEAD@{17}: commit: Bob updates line 2
c342438 HEAD@{18}: checkout: moving from main to branch-bob
c342438 HEAD@{19}: checkout: moving from branch-alice to main
2403fde (branch-alice) HEAD@{20}: commit: Alice updates line 2
c342438 HEAD@{21}: checkout: moving from main to branch-alice
c342438 HEAD@{22}: checkout: moving from main to main
c342438 HEAD@{23}: pull origin main: Fast-forward
da2f7e5 HEAD@{24}: checkout: moving from feature/about-page to main
7d7046f (origin/feature/about-page, feature/about-page) HEAD@{25}: commit: Add about.txt page
da2f7e5 HEAD@{26}: checkout: moving from main to feature/about-page
da2f7e5 HEAD@{27}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{29}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{31}: Branch: renamed refs/heads/master to refs/heads/main
da2f7e5 HEAD@{33}: commit: Update README with learning goals
34362a5 HEAD@{34}: commit (initial): Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b feature/rebase-demo 0975196
error: The following untracked working tree files would be overwritten by checkout:
        feature.txt
Please move or remove them before you switch branches.
Aborting

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (main)
$ git checkout -b feature/rebase-demo 0975196
Switched to a new branch 'feature/rebase-demo'

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ git reflog
0975196 (HEAD -> feature/rebase-demo) HEAD@{0}: checkout: moving from main to feature/rebase-demo
e651b73 (main) HEAD@{1}: cherry-pick: Fix critical security bug
8cf483c (origin/main) HEAD@{2}: checkout: moving from feature/bugfix-demo to main
96869a7 (feature/bugfix-demo) HEAD@{3}: commit: Fix critical security bug
68cdcf7 HEAD@{4}: checkout: moving from feature/rebase-demo to feature/bugfix-demo
68cdcf7 HEAD@{5}: rebase (finish): returning to refs/heads/feature/rebase-demo
68cdcf7 HEAD@{6}: rebase (squash): WIP: draft 1
0975196 (HEAD -> feature/rebase-demo) HEAD@{7}: rebase (squash): # This is a combination of 2 commits.
894f94a HEAD@{8}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{9}: rebase (finish): returning to refs/heads/feature/rebase-demo
9e84d91 HEAD@{10}: rebase (start): checkout HEAD~3
9e84d91 HEAD@{11}: commit: Add finished feature
5417936 HEAD@{12}: commit: WIP: draft 2
894f94a HEAD@{13}: commit: WIP: draft 1
8cf483c (origin/main) HEAD@{14}: checkout: moving from main to feature/rebase-demo
8cf483c (origin/main) HEAD@{15}: commit (merge): Resolve merge conflict between Alice and Bob
2403fde (branch-alice) HEAD@{16}: merge branch-alice: Fast-forward
c342438 HEAD@{17}: checkout: moving from branch-bob to main
f0213ca (branch-bob) HEAD@{18}: commit: Bob updates line 2
c342438 HEAD@{19}: checkout: moving from main to branch-bob
c342438 HEAD@{20}: checkout: moving from branch-alice to main
2403fde (branch-alice) HEAD@{21}: commit: Alice updates line 2
c342438 HEAD@{22}: checkout: moving from main to branch-alice
c342438 HEAD@{23}: checkout: moving from main to main
c342438 HEAD@{24}: pull origin main: Fast-forward
da2f7e5 HEAD@{25}: checkout: moving from feature/about-page to main
7d7046f (origin/feature/about-page, feature/about-page) HEAD@{26}: commit: Add about.txt page
da2f7e5 HEAD@{27}: checkout: moving from main to feature/about-page
da2f7e5 HEAD@{28}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{30}: Branch: renamed refs/heads/main to refs/heads/main
da2f7e5 HEAD@{32}: Branch: renamed refs/heads/master to refs/heads/main
da2f7e5 HEAD@{34}: commit: Update README with learning goals
34362a5 HEAD@{35}: commit (initial): Initial commit: ADD README file

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$ ^C

Gogie Malathu@WINDOWS-UOQCCU3 MINGW64 ~/git-practice (feature/rebase-demo)
$

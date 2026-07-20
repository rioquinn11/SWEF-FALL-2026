# Homework 1: The Hotfix Simulation

**Objective**: Simulate a real-world software engineering scenario involving concurrent development, critical bug fixes, and merge conflicts.

**Goal**: You have two options to complete this assignment.

1. **GitHub UI (Beginner Friendly)**: Do everything on the website.
2. **Command Line (Advanced)**: Do everything in your terminal.

## Context

You are a developer at a fast-paced tech startup. You are working on a new feature for the company website. Suddenly, a critical bug is reported in production (the main branch). You must pause your feature work, fix the bug, deploy it, and then reconcile your feature branch with the new fix.

## Setup

1. Ensure you have forked this repository and are looking at **your fork** on GitHub.
2. Navigate to the `01-git/hw/` folder.
3. You should see a file named `app_config.json`. This is the file we will be working on.

---

## Option 1: The GitHub Way (Pull Request)

### Step 1: The New Feature

1. While looking at your repo on GitHub, click the branch selector (top left of the file list, usually says **main**).
2. Type `feature/dark-mode` and click **Create branch: feature/dark-mode from main**.
3. Navigate to `01-git/hw/app_config.json` in this new branch.
4. Click the **Pencil icon** to edit the file.
5. Make the following changes:
   - Change `"theme": "light"` to `"theme": "dark"`.
   - Change `"version": "1.0.0"` to `"version": "1.1.0-beta"`.
6. Click **Commit changes...**, add a message "Implement dark mode", and click **Commit changes**.

### Step 2: The Critical Bug (Hotfix)

**EMERGENCY!** Users are reporting that the app crashes if more than 100 users join. Management wants the limit raised to 500 immediately.

1. Switch back to the `main` branch using the branch selector.
2. Navigate back to `01-git/hw/app_config.json`.
3. Click the **Pencil icon** to edit.
4. Make the following changes:
   - Change `"maxUsers": 100` to `"maxUsers": 500`.
   - Change `"version": "1.0.0"` to `"version": "1.0.1"`.
5. Click **Commit changes...**, add a message "Hotfix: Increase user limit", and click **Commit changes**.
   _(Note: In a real company, you would make a separate hotfix branch, but committing to main is okay for this simulation)._

### Step 3: The Conflict (Pull Request)

Now you need to merge your feature branch into main, but both have changed!

1. Go to the **Pull Requests** tab.
2. Click **New pull request**.
3. Set **base: main** and **compare: feature/dark-mode**.
4. You should see a message: **Can’t automatically merge**.
5. Click **Create pull request**.

### Step 4: Resolution

1. On the PR page, you will see a section stating "This branch has conflicts that must be resolved".
2. Click the **Resolve conflicts** button.
3. You will see the file with conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`).
4. **Logic**: We want the **Dark Mode** settings (theme: dark), the **Increased User Limit** (500), and the version should be the new feature version (`1.1.0-beta`).
   - _Hint: Delete the markers and combine the lines to create the correct final JSON._
5. Once fixed, click **Mark as resolved**.
6. Click **Commit merge**.
7. Finally, click **Merge pull request** to finish.

---

## Option 2: The CLI Way (Advanced/Optional)

If you want to feel like a pro hacker, do it this way.

### Step 1: The New Feature

1. Open your terminal in your local repo folder.
2. Create and switch to a new branch:
   ```bash
   git checkout -b feature/dark-mode-cli
   ```
3. Open `01-git/hw/app_config.json` in VS Code.
4. Change `theme` to `dark` and `version` to `1.1.0-beta`.
5. Save and commit:
   ```bash
   git commit -am "Implement dark mode theme"
   ```

### Step 2: The Critical Bug (Hotfix)

1. Switch back to `main`:
   ```bash
   git checkout main
   ```
2. Open `01-git/hw/app_config.json` in VS Code.
3. Change `maxUsers` to `500` and `version` to `1.0.1`.
4. Save and commit:
   ```bash
   git commit -am "Critical hotfix: Increase user limit"
   ```

### Step 3: The Conflict

1. Switch back to your feature branch (or stay on main and merge feature in, order doesn't matter for the conflict):
   ```bash
   git merge feature/dark-mode-cli
   ```
   _(If you are on main and merging the feature in)_.
2. **Conflict!** Git will scream at you.

### Step 4: Resolution

1. Open `01-git/hw/app_config.json`.
2. VS Code will highlight the conflict. Choose the changes that satisfy our requirements (Dark Mode + 500 Users + Beta Version).
3. Save the file.
4. Commit the resolution:
   ```bash
   git add 01-git/hw/app_config.json
   git commit -m "Resolved config conflict"
   ```

## Submission

1. **Merge your changes** (if not already done).
2. Create a new file in this directory (`01-git/hw/`) called `submission.md`.
3. In `submission.md`:
   - Write 3-4 sentences on where you think Git will be useful in your future career.
   - Include a screenshot of your success (Merged PR on GitHub or `git log --graph` in CLI).

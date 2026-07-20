# Paired Merge Conflict (10–15 minutes)

Work with a partner. You will **cause a real merge conflict on purpose**, then
resolve it together. Unlike the warm-up, nobody fakes the conflict here — you
create it by both editing the **same line** and pushing to the **same repo**.

## Before you start

- **One shared repo.** One partner forks this repository and adds the other as a
  collaborator (see [../how_to_fork.md](../how_to_fork.md)). You are **not** using
  two separate forks — you both push to the *same* fork.
- **Both clone that fork** to your own laptop:
  ```bash
  git clone git@github.com:<owner>/SWEF-FALL-2026.git
  cd SWEF-FALL-2026
  ```
- Decide who is **Partner A** and who is **Partner B**.
- The file you will both edit is `pair-config/discount.py`. It starts as:
  ```python
  DISCOUNT_PERCENT = 10
  ```

> Do the steps **in order**. The whole point is that A goes first and B goes
> second — that timing is what creates the conflict.

---

## Partner A — go first

1. Make sure you're up to date:
   ```bash
   git pull
   ```
2. Open `01-git/activity/pair-config/discount.py` and change the number to **your**
   value:
   ```python
   DISCOUNT_PERCENT = 15
   ```
3. Save, then commit and push:
   ```bash
   git add 01-git/activity/pair-config/discount.py
   git commit -m "A: set discount to 15"
   git push
   ```
4. This **succeeds** — you got there first. Tell Partner B you're done.

## Partner B — go second (this is where the conflict happens)

> ⚠️ **Do NOT run `git pull` before you edit.** If you pull first, you'll just get
> A's change with no conflict, and the exercise won't work. Edit on your *old*
> copy on purpose.

1. Open the **same** file `01-git/activity/pair-config/discount.py` and change the
   number to a **different** value:
   ```python
   DISCOUNT_PERCENT = 25
   ```
2. Save, then commit and try to push:
   ```bash
   git add 01-git/activity/pair-config/discount.py
   git commit -m "B: set discount to 25"
   git push
   ```
3. The push is **REJECTED**. You'll see:
   ```
   ! [rejected]        main -> main (fetch first)
   error: failed to push some refs ...
   hint: Updates were rejected because the remote contains work that you do
   hint: not have locally.
   ```
   This is **not** the conflict yet — Git is just refusing to push because A's
   commit is on the remote and you don't have it.
4. Now pull to bring A's work in:
   ```bash
   git pull
   ```
5. **THIS is the merge conflict.** Git can't combine A's `15` and your `25` on the
   same line, so it stops and writes both into the file:
   ```
   Auto-merging 01-git/activity/pair-config/discount.py
   CONFLICT (content): Merge conflict in .../discount.py
   ```
   The file now looks like:
   ```python
   <<<<<<< HEAD
   DISCOUNT_PERCENT = 25
   =======
   DISCOUNT_PERCENT = 15
   >>>>>>> <some commit hash>
   ```
   `HEAD` is **your** version; below `=======` is **A's** version.

## Both partners — resolve it together

1. **Talk to each other.** Which discount is actually correct — 15 or 25? In real
   life this is a conversation, not a coin flip. Pick one.
2. Partner B edits the file: delete the three marker lines
   (`<<<<<<<`, `=======`, `>>>>>>>`) **and** the value you're not keeping, leaving
   one clean line, e.g.:
   ```python
   DISCOUNT_PERCENT = 20
   ```
3. Save, then finish the merge and push:
   ```bash
   git add 01-git/activity/pair-config/discount.py
   git commit -m "Resolve discount conflict: agreed on 20"
   git push
   ```
4. Partner A pulls to get the agreed result:
   ```bash
   git pull
   ```
   Both laptops now show the same final value. Done.

---

## What just happened (the takeaway)

- A **rejected push** (`! [rejected] ... fetch first`) is **not** a merge conflict.
  It just means the remote has commits you don't. It happens whether or not the
  content clashes.
- A **merge conflict** only appears when you actually merge/pull two histories and
  Git finds the **same lines** changed differently — it can't guess, so it hands
  the decision to you via the `<<<<<<< / ======= / >>>>>>>` markers.
- Resolving = deleting the markers + choosing the final content + committing.

## Want to run it again?

Reset the file back to the start and re-do it (swap who goes first):
```bash
# from an up-to-date repo, on main
printf '# Team discount setting — you and your partner will both edit this line.\nDISCOUNT_PERCENT = 10\n' > 01-git/activity/pair-config/discount.py
git commit -am "Reset pair-config discount to 10"
git push
```

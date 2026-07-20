# 5-Minute Merge Conflict Warm-Up: `DISCOUNT_PERCENT`

The simplest possible real conflict: one Python variable, two values,
one merge. Good as a warm-up before a bigger activity, or as a live demo.

## Setup

```bash
bash setup.sh
cd discount-config
```

This creates `config.py` on `main` with one line:

```python
DISCOUNT_PERCENT = 10
```

...and two branches that each changed it differently:
- `feature/dev-a` → `DISCOUNT_PERCENT = 15` ("bump for spring sale")
- `feature/dev-b` → `DISCOUNT_PERCENT = 20` ("bump for clearance event")

## Run it (about 2 minutes)

```bash
git checkout feature/dev-a
git merge feature/dev-b
```

You'll see:

```
Auto-merging config.py
CONFLICT (content): Merge conflict in config.py
Automatic merge failed; fix conflicts and then commit the result.
```

Open `config.py`:

```python
<<<<<<< HEAD
DISCOUNT_PERCENT = 15
=======
DISCOUNT_PERCENT = 20
>>>>>>> feature/dev-b
```

## Resolve it

Decide on a final value (talk to your "teammate," or just pick one — the
point is the mechanics, not which number wins), delete the `<<<<<<<`,
`=======`, and `>>>>>>>` lines, leaving one clean line:

```python
DISCOUNT_PERCENT = 20
```

Then:

```bash
git add config.py
git commit
```

Confirm it worked:

```bash
git status        # should be clean
cat config.py      # should show one line, no markers
git log --oneline --graph
```

## Talking points (30 seconds each)

- Git couldn't guess which number you wanted — that's *why* it's a
  conflict rather than an error.
- The three-line result (`<<<<<<<` / `=======` / `>>>>>>>`) always means
  "here's your version, here's theirs, you decide."
- In real life this would be a Slack message to Dev A or Dev B, not a
  guess — the code alone doesn't tell you which discount is actually
  correct for the business.

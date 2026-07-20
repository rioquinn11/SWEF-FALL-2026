# Merge Conflict Warm-Up (5 minutes)

Two teammates changed the **same line** to different values, so Git couldn't
pick a winner. The file already has the conflict in it. Your job: clean it up.

## 1. Open the file

```
discount-config/config.py
```

It looks like this:

```python
<<<<<<< HEAD
DISCOUNT_PERCENT = 15
=======
DISCOUNT_PERCENT = 20
>>>>>>> feature/dev-b
```

## 2. Edit the number

Delete the three marker lines (`<<<<<<<`, `=======`, `>>>>>>>`) **and** one of
the numbers. Pick the value you want and leave just one clean line:

```python
DISCOUNT_PERCENT = 20
```

Save the file.

## 3. Commit your fix

```bash
git add discount-config/config.py
git commit -m "Resolve discount conflict"
```

Done.

---

**Why it happened:** both branches edited the same line, so Git can't guess
which number is right — it hands the decision to you. The `<<<<<<<` /
`=======` / `>>>>>>>` block always means "your version / their version — you
choose." In real life you'd ask the teammate which discount is actually
correct, not just pick one.

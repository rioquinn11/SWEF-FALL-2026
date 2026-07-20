#!/bin/bash
set -e
REPO="discount-config"
rm -rf "$REPO" "${REPO}-bare"

mkdir "${REPO}-bare"
git init --bare -q "${REPO}-bare"
git clone -q "${REPO}-bare" "$REPO"
cd "$REPO"
git config user.email "instructor@example.com"
git config user.name "Instructor"
git branch -m main

cat > config.py << 'EOF'
DISCOUNT_PERCENT = 10
EOF

git add config.py
git commit -q -m "Initial discount config"
git push -q origin main

git checkout -q -b feature/dev-a
sed -i 's/DISCOUNT_PERCENT = 10/DISCOUNT_PERCENT = 15/' config.py
git commit -q -am "Dev A: bump discount to 15 for spring sale"
git push -q origin feature/dev-a

git checkout -q main
git checkout -q -b feature/dev-b
sed -i 's/DISCOUNT_PERCENT = 10/DISCOUNT_PERCENT = 20/' config.py
git commit -q -am "Dev B: bump discount to 20 for clearance event"
git push -q origin feature/dev-b

git checkout -q main
echo "Scaffolded. Branches: feature/dev-a (15), feature/dev-b (20)."

make
cd public

git init
git config user.name "Toshaan Bharvani"
git config user.email "toshaan@gmail.com"

echo "gsebelux.eu" > CNAME
git add .
git commit -m "Deploy from CircleCI"

git push --force --quiet "https://${GH_TOKEN}@github.com/devopsdays/devopsdays-web.git" master:gh-pages

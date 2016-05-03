
name="$(cat ./git/name.cry | gpg)"
email="$(cat ./git/email.cry | gpg)"

git config --global user.name "$name"
git config --global user.email "$email"


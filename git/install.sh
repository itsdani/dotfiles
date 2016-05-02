
name="$(cat name.cry | gpg)"
email="$(cat email.cry | gpg)"

git config --global user.name "$name"
git config --global user.email "$email"


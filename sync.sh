gcloud auth login

teller env >.config/fabric/.env

# rm ~/.zshrc
rm ~/.bashrc

stow .

echo "## Follow the instructions at https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions to enable Fira Code in VS Code" \
    | gum format

echo '## Execute `source ~/.bashrc`.' | gum format
#echo '## Execute `source ~/.zshrc`.' | gum format
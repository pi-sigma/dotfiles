# .bash_profile

# Load .profile
if [ -f ~/.profile ]; then
	source ~/.profile
fi

if [ -z "$SSH_AGENT_PID" ]; then
    eval $(ssh-agent -s) > /dev/null 2>&1
fi

#ssh-add ~/.ssh/id_personal
eval $(keychain --eval --agents ssh ~/.ssh/id_personal)

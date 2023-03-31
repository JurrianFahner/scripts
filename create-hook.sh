#!/usr/bin/env bash

GIT_ROOT_DIR=$(git rev-parse --show-toplevel)

if [[ $# -eq 1 ]]; then
	COMMAND="$1"
	HOOK="post-commit"
elif [[ $# -eq 2 ]]; then
	HOOK="$1"
	COMMAND="$2"
else
	echo ""
	echo "Usage: $0 HOOK COMMAND"
	echo ""
	echo "Hook creator script"
	echo ""
	echo "If hook is not specified \"post-commit\" will be used as default"
	exit 4
fi

SCRIPT_FILE="$GIT_ROOT_DIR/$COMMAND"
if [[ ! -f $SCRIPT_FILE ]]; then
       echo "$SCRIPT_FILE does not exist"
       exit 5
fi

cat << EOF > .git/hooks/$HOOK
#!/usr/bin/env bash
GIT_ROOT_DIR=\$(git rev-parse --show-toplevel)
\$GIT_ROOT_DIR/$COMMAND
EOF

chmod u+x .git/hooks/$HOOK
echo "The hook is installed at .git/hooks/$HOOK"
echo "and it will invoke following command (if hook is triggered): $COMMAND" 


#!/bin/bash

# Check bash version (requires 4.0+ for associative arrays)
if ((BASH_VERSINFO[0] < 4)); then
    echo "Error: This script requires Bash 4.0 or higher (current version: $BASH_VERSION)"
    echo "macOS ships with Bash 3.2. Install a newer version with: brew install bash"
    echo "Then run this script with: /opt/homebrew/bin/bash $0"
    exit 1
fi

# when editing repositories, make sure to update mkdocs.yml accordingly
declare -A repos=(
    ["Landing page UI"]="https://github.com/RedHatInsights/landing-page-frontend.git"
    ["Settings UI"]="https://github.com/RedHatInsights/settings-frontend.git"
    ["User preferences UI"]="https://github.com/RedHatInsights/user-preferences-frontend.git"
    ["API catalog"]="https://github.com/RedHatInsights/api-documentation-frontend.git"
    ["Notifications UI"]="https://github.com/RedHatInsights/notifications-frontend.git"
    ["RBAC UI"]="https://github.com/RedHatInsights/insights-rbac-ui.git"
    ["Sources UI"]="https://github.com/RedHatInsights/sources-ui.git"
    ["Learning resource page"]="https://github.com/RedHatInsights/learning-resources.git"
    ["Payload tracker UI"]="https://github.com/RedHatInsights/payload-tracker-frontend.git"
    ["UI starter app"]="https://github.com/RedHatInsights/frontend-starter-app.git"
    ["Frontend components"]="https://github.com/RedHatInsights/frontend-components.git"
    ["PF Component groups"]="https://github.com/patternfly/react-component-groups.git"
    ["PF Data view"]="https://github.com/patternfly/react-data-view.git"
    ["PF Virtual assistant"]="https://github.com/patternfly/virtual-assistant.git"
    ["Chrome service backend"]="https://github.com/RedHatInsights/chrome-service-backend"
)

TARGET_DIR="pages/services"
TEMP_DIR="temp_repos"

get_default_branch() {
    local repo_dir=$1
    cd "$repo_dir" || exit
    git remote set-head origin -a >/dev/null 2>&1
    local default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    cd - >/dev/null || exit
    echo "$default_branch"
}

# clone or pull the latest repo changes
clone_or_pull_repo() {
    local repo_name=$1
    local repo_url=$2
    local repo_dir="${TEMP_DIR}/${repo_name}"

    if [ ! -d "$repo_dir" ]; then
        echo "Cloning $repo_name..."
        git clone "$repo_url" "$repo_dir"
    else
        echo "Pulling latest changes for $repo_name..."
        cd "$repo_dir" || exit

        default_branch=$(get_default_branch "$repo_dir")

        git pull origin "$default_branch"
        cd - || exit
    fi
}

copy_readme() {
    local repo_name=$1
    local repo_dir="${TEMP_DIR}/${repo_name}"
    local readme_path="${repo_dir}/README.md"
    local dest_path="${TARGET_DIR}/${repo_name}.md"
    local docs_path="${repo_dir}/docs"
    local nested_docs_path="$TARGET_DIR/${repo_name// /_}"

    if [ -f "$readme_path" ]; then
        cp -f "$readme_path" "$dest_path"
    else
        echo "README.md not found in $repo_name!"
    fi

    if [ -d "$docs_path" ]; then
        cp -rf "$docs_path" "$nested_docs_path"
    else 
        echo "docs directory not found in $repo_name!"
    fi
}

main() {
    mkdir -p "$TARGET_DIR"
    mkdir -p "$TEMP_DIR"

    for repo_name in "${!repos[@]}"; do
        repo_url="${repos[$repo_name]}"

        clone_or_pull_repo "$repo_name" "$repo_url"

        copy_readme "$repo_name"
    done

    rm -rf "$TEMP_DIR"
}

main

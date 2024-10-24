#!/bin/bash

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
)

TARGET_DIR="pages/services"
TEMP_DIR="temp_repos"
MKDOCS_FILE="mkdocs.yml"
SERVICES_SECTION="Services"
BRANCH_NAME="update-services-docs-$(date +'%Y%m%d%H%M%S')"

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

    if [ -f "$readme_path" ]; then
        cp "$readme_path" "$dest_path"
    else
        echo "README.md not found in $repo_name!"
    fi
}

update_mkdocs_yml() {
    local repo_name=$1
    local new_entry
    new_entry=$(printf "      - %s: %s\n" "$repo_name" "${TARGET_DIR}/${repo_name}.md")

    if ! grep -q "$SERVICES_SECTION:" "$MKDOCS_FILE"; then
        echo -e "\nnav:\n  - $SERVICES_SECTION:\n$new_entry" >> "$MKDOCS_FILE"
    else
        if grep -q "$repo_name" "$MKDOCS_FILE"; then
            echo "Navigation entry for $repo_name already exists in $MKDOCS_FILE."
        else
            sed -i "/- $SERVICES_SECTION:/a$new_entry" "$MKDOCS_FILE"
        fi
    fi
}

main() {
    mkdir -p "$TARGET_DIR"
    mkdir -p "$TEMP_DIR"

    for repo_name in "${!repos[@]}"; do
        repo_url="${repos[$repo_name]}"

        clone_or_pull_repo "$repo_name" "$repo_url"

        copy_readme "$repo_name"

        update_mkdocs_yml "$repo_name"
    done

    rm -rf "$TEMP_DIR"

    if ! git diff --quiet; then
        git add .
        git commit -m "Update services docs with latest READMEs"
    else
        echo "No changes to commit."
    fi
}

main

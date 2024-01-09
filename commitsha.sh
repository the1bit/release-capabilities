repo_owner=kyma-project
repo_name=eventing-publisher-proxy

# Get the latest tag
latest_release=$(curl -Ls https://api.github.com/repos/$repo_owner/$repo_name/tags | jq '.[length -1].name' | tr -d '"')

# Get the tag sha of latest release
tag_sha=$(curl -Ls https://api.github.com/repos/$repo_owner/$repo_name/git/ref/tags/$latest_release | jq '.object.sha' | tr -d '"')

# Get commit sha of previous release
full_commit_sha=$(curl -Ls https://api.github.com/repos/$repo_owner/$repo_name/git/tags/$tag_sha | jq '.object.sha'  | tr -d '"')

# Short commit sha
echo $full_commit_sha | head -c 7
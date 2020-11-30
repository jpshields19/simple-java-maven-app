output=$(printf \
    'LOCAL_REPOSITORY=${settings.localRepository}\n'\
    'GROUP_ID=${project.groupId}\n'
    'ARTIFACT_ID=${project.artifactId}\n'\
    'POM_VERSION=${project.version}\n0\n' \
  | mvn help:evaluate --non-recursive )

localRepository=$(echo "$output" | grep '^LOCAL_REPOSITORY' | cut -d = -f 2)
groupId=$(echo "$output" | grep '^GROUP_ID' | cut -d = -f 2)
artifactId=$(echo "$output" | grep '^ARTIFACT_ID' | cut -d = -f 2)
pomVersion=$(echo "$output" | grep '^POM_VERSION' | cut -d = -f 2)

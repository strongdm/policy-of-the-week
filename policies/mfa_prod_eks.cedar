//
// Permit connections to Production Kubernetes clusters
//
@mfa("")
permit (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    ((resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod")) &&
    ((resource.sdm.tags has "type" && resource.sdm.tags["type"] == "k8s"))
};

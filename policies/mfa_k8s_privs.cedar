//
// Prompt for MFA when impersonating the "sdm-devops" K8s group
//

@k8s_impersonate_groups("sdm-devops")
@mfa("?cache=15m")
permit (
    principal in StrongDM::Role::"r-2341234123412341",
    action == K8s::Action::"impersonate",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context has k8s && context.k8s.groups == ["sdm-devops"]
};

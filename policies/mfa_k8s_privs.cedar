//
// Prompt for MFA when impersonating the "sdm-devops" K8s group
//

@k8s_impersonate_groups("sdm-devops")
@mfa("?cache=15m")
permit (
    principal in StrongDM::Role::"r-08601d0d67eb1ba3",
    action == K8s::Action::"impersonate",
    resource in StrongDM::Resource::"rs-7a688af667e479ea"
) when {
    context has k8s && context.k8s.groups == ["sdm-devops"]
};

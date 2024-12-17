//
// Restrict access to resources to EU for GDPR resources
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    resource.sdm.tags has compliance && resource.sdm.tags.compliance == "GDPR"
} unless {
    context.location in Location::Continent::"EU"
};

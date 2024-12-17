//
// Restrict access to resources to EU only
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource
) unless {
    context.location in Location::Continent::"EU"
};

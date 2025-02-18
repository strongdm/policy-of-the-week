//
// Restrict connections by IP address
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource
) unless {
    context.location == Location::IP::"192.0.2.1"
};

//
// Permit connections by IP address
//
permit (
    principal,
    action,
    resource
) when {
    context.location == Location::IP::"192.0.2.1"
};

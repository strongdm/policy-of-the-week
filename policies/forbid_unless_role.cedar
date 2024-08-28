//
// Forbid access to the database unless the user is in the approved role
//
forbid (
    principal,
    action,
    resource in StrongDM::Resource::"rs-2341234123412341"
) unless {
    principal in StrongDM::Role::"r-2341234123412341"
};

//
// Forbid access to the database unless the user is in the approved role
//
forbid (
    principal,
    action,
    resource in StrongDM::Resource::"rs-0d4dc56c66a868fb"
) unless {
    principal in StrongDM::Role::"r-4d9840c966a82a07"
};

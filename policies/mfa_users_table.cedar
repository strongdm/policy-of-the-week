//
// Require MFA prompt to read data from the users table
//
@mfa("")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-0d4dc56c66a868fb"
) when {
    context.sql.tables.contains("pg_user")
};

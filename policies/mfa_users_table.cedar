//
// Require MFA prompt to read data from the users table
//
@mfa("")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("pg_user")
};

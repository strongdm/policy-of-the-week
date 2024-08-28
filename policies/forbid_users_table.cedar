//
// Forbid access to the "pg_user" table on PostgreSQL to avoid potential 
// exfiltration of database user information and unauthorized access
//
@error("ACTION FORBIDDEN BY POLICY")
forbid (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("pg_user")
};

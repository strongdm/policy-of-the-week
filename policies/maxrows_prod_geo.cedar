//
// Restrict SELECT actions based on geo privacy requirements, returning 10 rows
//
@maxrows("10")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("cardholders") &&
    context.location in Location::Country::"US"
};

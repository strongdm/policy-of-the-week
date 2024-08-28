//
// Require an approval from an admin to update the cardholders table in the database
//
@approve("af-2341234123412341")
permit (
    principal,
    action == SQL::Action::"update",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("cardholders")
};

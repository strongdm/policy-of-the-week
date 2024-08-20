//
// Require an approval from an admin to update the cardholders table in the database
//
@approve("af-16bc081565cd5d7b")
permit (
    principal,
    action == SQL::Action::"update",
    resource in StrongDM::Resource::"rs-0d4dc56c66a868fb"
) when {
    context.sql.tables.contains("cardholders")
};

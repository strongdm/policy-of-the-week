//
// Limit the number of maximum rows a user is allowed to read from the 
// fav_colors table unless the user is in the approved role
//
@notify("10 row limit on SELECT for this table and permission level")
@maxrows("10")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("fav_colors")
} unless {
    principal in StrongDM::Role::"r-2341234123412341"
};

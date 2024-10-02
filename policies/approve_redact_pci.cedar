//
// Request approval and redact "ssn" column in "cardholder" PCI table
//
@approve("af-2341234123412341")
@redact("ssn")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("cardholders")
};

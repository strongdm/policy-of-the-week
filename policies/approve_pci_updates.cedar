//
// Require approval for UPDATE actions on PCI "cardholders" table
//
@approve("af-2341234123412341")
permit (
    principal,
    action == SQL::Action::"update",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    context.sql.tables.contains("cardholders") &&
    (resource.sdm.tags has "compliance" && resource.sdm.tags["compliance"] == "true") &&
    (resource.sdm.tags has "regulation" && resource.sdm.tags["regulation"] == "pci")
};

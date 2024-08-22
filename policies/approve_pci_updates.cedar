//
// Require approval for UPDATE actions on PCI "cardholders" table
//
@approve("af-16bc081565d5d7b")
permit (
    principal,
    action == SQL::Action::"update",
    resource in StrongDM::Resource::"rs-0d4dc56c66a868fb"
) when {
    context.sql.tables.contains("cardholders") &&
    (resource.sdm.tags has "compliance" && resource.sdm.tags["compliance"] = "true") &&
    (resource.sdm.tags has "regulation" && resource.sdm.tags["regulation"] == "pci")
};

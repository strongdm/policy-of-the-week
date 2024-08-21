//
// Restrict SELECT actions based on geo privacy requirements
//
@maxrows("10")
permit (
    principal,
    action == SQL::Action::"select",
    resource in StrongDM::Resource::"rs-0d4dc56c66a868fb"
) when {
    context.sql.tables.contains("mailing_address") &&
    (resource.sdm.tags has "region" && resource.sdm.tags["region"] == "EU") &&
    (resource.sdm.tags has "gdpr" && resource.sdm.tags["gdpr"] == "true") &&
    (resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod")
} unless {
    (resource.sdm.tags has "env" && resource.sdm.tags["env"] == "dev") ||
    (resource.sdm.tags has "env" && resource.sdm.tags["env"] == "staging")
};

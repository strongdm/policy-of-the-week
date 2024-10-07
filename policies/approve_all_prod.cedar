@approve("af-66d8b4b165e24907")
permit (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    principal in StrongDM::Role::"r-4f8678a666f2ed8f" && // All members of "Prod" Role
    (resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod") // All resources in Prod
};

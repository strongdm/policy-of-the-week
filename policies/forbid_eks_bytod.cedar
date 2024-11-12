//
// Restrict connecting to production EKS clusters to only during business hours
//
permit (
    principal,
    action == StrongDM::Action::"connect",
    resource in StrongDM::Resource::"rs-2341234123412341"
) when {
    // time-of-day section
    [2, 3, 4, 5, 6].contains(context.utcNow.dayOfWeek) &&
    context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() > 10 &&
    context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() < 17 &&
    // resource tags section
    ((resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod")) &&
    ((resource.sdm.tags has "type" && resource.sdm.tags["type"] == "k8s"))
};

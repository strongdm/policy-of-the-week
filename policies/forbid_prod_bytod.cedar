//
// Restrict connecting to production EKS clusters to only during business hours
//
forbid (
    principal,
    action == StrongDM::Action::"connect",
    resource
) when {
    // resource tags section
    ((resource.sdm.tags has "env" && resource.sdm.tags["env"] == "prod"))
} unless {
    // time-of-day section
    [2, 3, 4, 5, 6].contains(context.utcNow.dayOfWeek) &&
        context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() > 10 &&
        context.utcNow.timestamp.offset(duration("-7h")).toTime().toHours() < 14
};
